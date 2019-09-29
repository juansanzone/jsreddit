//
//  PostModel.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/28/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

final class PostModel: NSObject {
    let id: String
    let userName: String
    let imageRemoteUrl: String
    let text: String
    let commentsQuantity: Int
    let timestamp: Double
    let url: String

    init(id: String, userName: String, imageUrl: String, text: String, commentsCount: Int,  timestamp: Double, url: String) {
        self.id = id
        self.userName = userName
        self.imageRemoteUrl = imageUrl
        self.text = text
        self.commentsQuantity = commentsCount
        self.timestamp = timestamp
        self.url = url
    }
}

extension PostModel: PostViewModelProtocol {
    func postId() -> String {
        return id
    }

    func authorUserName() -> String {
        return userName
    }

    func timeAgo() -> String {
        return timestamp.stringTimeAgo()
    }

    func imageUrl() -> String {
        return imageRemoteUrl
    }

    func postText() -> String {
        return text
    }

    func commentsCount() -> Int {
        return commentsQuantity
    }

    func postUrl() -> String {
        return url
    }
}
