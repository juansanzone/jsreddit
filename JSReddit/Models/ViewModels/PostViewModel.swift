//
//  PostViewModel.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/27/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

struct PostViewModel {
    private var posts: [PostViewModelProtocol] = [PostMock1(), PostMock2(), PostMock3()]

    func getPosts() -> [PostViewModelProtocol] {
        return posts
    }

    @discardableResult
    mutating func remove(_ post: PostViewModelProtocol) -> PostViewModel {
        if let targetIndex = posts.firstIndex(where: {$0 === post}) {
            posts.remove(at: targetIndex)
        }
        return self
    }

    @discardableResult
    mutating func removeAll() -> PostViewModel {
        posts.removeAll()
        return self
    }
}
