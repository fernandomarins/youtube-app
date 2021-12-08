//
//  DetailViewController.swift
//  youtube-app
//
//  Created by Fernando Marins on 08/12/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Clear the fields
        clearFields()
        
        guard let video = video else {
            return
        }
        
        // Create access to the item
        let accessItem = video.snippet!
        
        // Create the embed URL
        let embedUrlString = Constants.youtubeEmbedUrl + "\(accessItem.thumbnails.high.url)"
        
        // Load into the web view
        let url = URL(string: embedUrlString)
        if let unwrappedUrl = url {
            let request = URLRequest(url: unwrappedUrl)
            webView.customUserAgent = "Mozilla/5.0 (iPad; CPU iPhone OS 13_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko)"
            webView.load(request)
        }
        
        // Set the title
        titleLabel.text = accessItem.title
        
        // Set the date
        dateLabel.text = accessItem.publishedAt
        
        // Set the description
        textView.text = accessItem.description

    }
    
    fileprivate func clearFields() {
        // Clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
    }

}
