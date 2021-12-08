//
//  Response.swift
//  youtube-app
//
//  Created by Fernando Marins on 07/12/21.
//

import Foundation

struct Response: Codable {
    let items: [Item]
}

struct Item: Codable {
    let snippet: Snippet?
}

struct Snippet: Codable {
    let resourceId: ResourceId
    let title: String
    let description: String
    let thumbnails: Thumbnails
    let publishedAt: String
}

struct ResourceId: Codable {
    let videoId: String
}

struct Thumbnails: Codable {
    let default_: Default?
    
    enum CodingKeys: String, CodingKey {
        case default_ = "default"
    }
}

struct Default: Codable {
    let url: String
}
