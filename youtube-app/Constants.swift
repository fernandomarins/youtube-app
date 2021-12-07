//
//  Constants.swift
//  youtube-app
//
//  Created by Fernando Marins on 07/12/21.
//

import Foundation

struct Constants {
    
    static var apiKey = "AIzaSyCWvl7aPpsR-gtys61EfwMHzkAN8Z6dOEk"
    static var playlistId = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var url = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.playlistId)&key=\(Constants.apiKey)"
    
}
