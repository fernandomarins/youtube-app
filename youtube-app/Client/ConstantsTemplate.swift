//
//  ConstantsTemplate.swift
//  youtube-app
//
//  Created by Fernando Marins on 07/12/21.
//

/*
 Add your own keys below and uncomment the code
 */
import Foundation


struct Constants {
    
    static var apiKey = ""
    static var playlistId = ""
    static var url = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.playlistId)&key=\(Constants.apiKey)"
    static let videoCellId = "videoCell"
}
