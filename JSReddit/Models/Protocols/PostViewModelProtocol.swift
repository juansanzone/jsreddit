//
//  PostViewModelProtocol.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/27/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

@objc protocol PostViewModelProtocol: NSObjectProtocol {
    func postId() -> String
    func authorUserName() -> String
    func timeAgo() -> String
    func imageUrl() -> String
    func postText() -> String
    func commentsCount() -> Int
    func postUrl() -> String
}
