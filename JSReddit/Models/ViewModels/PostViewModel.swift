//
//  PostViewModel.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/27/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

class PostViewModel: NSObject {
    private var posts: [PostViewModelProtocol] = [PostViewModelProtocol]()
    private let postService = RedditPostsService()

    func fetchPosts(success: ((Bool)->Void)? = nil) {
        postService.getTopPosts { [weak self] remoteResponse in
            self?.posts = remoteResponse
            if remoteResponse.count > 0 {
                success?(true)
            } else {
                success?(false)
            }
        }
    }

    func getPosts() -> [PostViewModelProtocol] {
        return posts
    }

    func getPostsCount() -> Int {
        return posts.count
    }

    func hasPosts() -> Bool {
        return getPostsCount() > 0
    }

    @discardableResult
    func remove(_ post: PostViewModelProtocol) -> PostViewModel {
        if let targetIndex = getPostIndex(post) {
            posts.remove(at: targetIndex)
        }
        return self
    }

    @discardableResult
    func removeAll() -> PostViewModel {
        posts.removeAll()
        return self
    }

    func getPostIndex(_ post: PostViewModelProtocol) -> Int? {
        guard let postIndex = posts.firstIndex(where: {$0 === post}) else { return nil }
        return postIndex
    }
}
