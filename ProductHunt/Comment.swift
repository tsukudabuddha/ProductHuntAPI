//
//  Post.swift
//  ProductHunt
//
//  Created by Andrew Tsukuda on 11/5/17.
//  Copyright © 2017 Andrew Tsukuda. All rights reserved.
//

import Foundation

struct Comment {
    let id: String
    let body: String
    
    init(id: String, body: String) {
        self.id = id
        self.body = body
    }
}

struct CommentContainer: Decodable {
    let comments: [Comment]
}

extension Comment: Decodable {
    enum Keys: String, CodingKey {
        case id
        case body
    }
    
    init(from decoder: Decoder) throws {
        // Define Keyed Container
        let container = try decoder.container(keyedBy: Keys.self)

        let id = try container.decodeIfPresent(Int.self, forKey: .id) ?? -1
        let body = try container.decodeIfPresent(String.self, forKey: .body) ?? "No comment"
        
        self.init(id: "\(id)", body: body)
    }
}

