//
//  CacheManager.swift
//  youtube-app
//
//  Created by Fernando Marins on 08/12/21.
//

import Foundation

class CacheManager {
    
    static var cache = [String: Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        // Store the image data and use the url as the key
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        // Try to get the data from the specified url
        
        return cache[url]
    }
}
