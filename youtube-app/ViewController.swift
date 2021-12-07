//
//  ViewController.swift
//  youtube-app
//
//  Created by Fernando Marins on 07/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideos()
        
    }


}

