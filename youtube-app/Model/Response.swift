//
//  Response.swift
//  youtube-app
//
//  Created by Fernando Marins on 07/12/21.
//

import Foundation

struct Response: Decodable {
    let items: [Item]
}

struct Item: Decodable {
    let snippet: Snippet?
}

struct Snippet: Decodable {
    let resourceId: ResourceId
    let title: String
    let description: String
    let thumbnails: Thumbnails
    let publishedAt: String
}

struct ResourceId: Decodable {
    let videoId: String
}

struct Thumbnails: Decodable {
    let high: High
}

struct High: Decodable {
    let url: String
}
