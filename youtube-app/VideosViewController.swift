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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadData()
    }
    
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
}

extension VideosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.videoCellId, for: indexPath)
        
        // Configure the cell
        let title = videos[indexPath.row].snippet?.title
        
        cell.textLabel?.text = title
        
        return cell
    }
    
}
