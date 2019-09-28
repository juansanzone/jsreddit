//
//  RedditResponseDto.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/28/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

// MARK: Reddit main responses DTO model
struct RedditResponseDto: Codable {
    let data: RedditDataResponseDto
}

// MARK: Reddit nasted 1 DTO model.
struct RedditDataResponseDto: Codable {
    let children: [RedditChildrenResponseDto]
}

// MARK: Reddit nasted 2 DTO model.
struct RedditChildrenResponseDto: Codable {
    let post: RedditPostDto
    enum CodingKeys: String, CodingKey {
        case post = "data"
    }
}

// MARK: Reddit Post DTO model.
struct RedditPostDto: Codable {
    let id: String
    let author_fullname: String
    let title: String
    let num_comments: Int
    let thumbnail: String
    let created: Double
}
