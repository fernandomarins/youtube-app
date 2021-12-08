//
//  ViewController.swift
//  youtube-app
//
//  Created by Fernando Marins on 07/12/21.
//

import UIKit

class VideosViewController: UIViewController {
    
    var videos = [Item]()
    var model = Model()
    
    @IBOutlet weak var tableView: UITableView!
    
    // - MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadData()
    }
    
    // - MARK: Fetching data
    
    fileprivate func loadData() {
        model.getVideos { response, error in
            guard let response = response else {
                if let error = error {
                    self.showAlert(message: error.localizedDescription)
                }
                
                return
            }
            
            self.videos = response.items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        // Performing the segue to the correct view controller
        if segue.identifier == "toDetails" {
            let detailVC = segue.destination as! DetailViewController
            detailVC.video = selectedVideo
            
            // Deselecting the row
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
    }
}

extension VideosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.videoCellId, for: indexPath) as! VIdeoTableViewCell
        
        // Configure the cell
        cell.setCell(videos[indexPath.row])
                
        return cell
    }
    
}
