//
//  VIdeoTableViewCell.swift
//  youtube-app
//
//  Created by Fernando Marins on 08/12/21.
//

import UIKit

class VIdeoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Item?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ item: Item) {
        
        video = item
        
        guard video != nil else {
            return
        }
        
        // Set the title
        titleLabel.text = video?.snippet?.title
        
        // Set the date
        let dateString = video?.snippet?.publishedAt
        let df = DateFormatter()
        
        // Formatting to the received type of date
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateString else {
            return
        }
        
        let newDate = df.date(from: date)
        
        // Formatting the type we want
        df.dateFormat = "EEEE, MMM d, yyyy"
        guard let unwrappedDate = newDate else {
            return
        }
        
        let changedDate = df.string(from: unwrappedDate)
        dateLabel.text = changedDate
        
        // Set the thumbail
        
        guard let urlThumbail = video?.snippet?.thumbnails.high.url else {
            return
        }
        
        // Check cache before downloading data
        
        if let cachedData = CacheManager.getVideoCache((video?.snippet?.thumbnails.high.url)!) {
            DispatchQueue.main.async {
                self.thumbnailImageView.image = UIImage(data: cachedData)
            }
            
            return
        }
        
        let url = URL(string: urlThumbail)
        
        let session = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            guard let data = data else {
                return
            }
            
            // Save the data in the cache
            CacheManager.setVideoCache(url!.absoluteString, data)
            
            // Create the image object
            let image = UIImage(data: data)
            
            // Set the image view
            DispatchQueue.main.async {
                self.thumbnailImageView.image = image
            }

        }
        
        session.resume()
        
    }

}
