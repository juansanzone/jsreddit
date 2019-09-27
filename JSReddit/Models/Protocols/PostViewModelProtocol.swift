//
//  PostViewModelProtocol.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/27/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

protocol PostViewModelProtocol: NSObjectProtocol {
    func postId() -> String
    func isReaded() -> Bool
    func authorUserName() -> String
    func timeAgo() -> String
    func imageUrl() -> String
    func postText() -> String
    func commentsCount() -> Int
}
