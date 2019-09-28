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

    func getPostsCount() -> Int {
        return posts.count
    }

    @discardableResult
    mutating func remove(_ post: PostViewModelProtocol) -> PostViewModel {
        if let targetIndex = getPostIndex(post) {
            posts.remove(at: targetIndex)
        }
        return self
    }

    @discardableResult
    mutating func removeAll() -> PostViewModel {
        posts.removeAll()
        return self
    }

    func getPostIndex(_ post: PostViewModelProtocol) -> Int? {
        guard let postIndex = posts.firstIndex(where: {$0 === post}) else { return nil }
        return postIndex
    }
}
