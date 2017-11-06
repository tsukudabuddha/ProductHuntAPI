//
//  Post.swift
//  ProductHunt
//
//  Created by Andrew Tsukuda on 11/1/17.
//  Copyright © 2017 Andrew Tsukuda. All rights reserved.
//

import Foundation

struct Post {
    let name: String
    let tagline: String
    let day: String
    let commentCount: Int
    
    init(name: String, tagline: String, day: String, commentCount: Int) {
        self.name = name
        self.tagline = tagline
        self.day = day
        self.commentCount = commentCount
    }
}

struct PostContainer: Decodable {
    let posts: [Post]
}

extension Post: Decodable {
    enum Keys: String, CodingKey {
        case name
        case tagline
        case day
        case commentCount = "comments_count"
    }
    
    init(from decoder: Decoder) throws {
        // Define Keyed Container
        let container = try decoder.container(keyedBy: Keys.self)
        let name = try container.decodeIfPresent(String.self, forKey: .name) ?? "No name"
        let tagline = try container.decodeIfPresent(String.self, forKey: .tagline) ?? "No tagline"
        let day = try container.decodeIfPresent(String.self, forKey: .day) ?? "No date"
        let commentCount = try container.decodeIfPresent(Int.self, forKey: .commentCount) ?? 9999
        
        self.init(name: name, tagline: tagline, day: day, commentCount: commentCount)
    }
}
