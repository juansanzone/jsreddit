//
//  PostsViewModel.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/27/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

class PostsViewModel: NSObject {
    private var posts: [PostViewModelProtocol] = [PostViewModelProtocol]()
    private let postService = RedditPostsService()
}

// Network calls.
extension PostsViewModel {
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

    func nextPage(success: ((Bool)->Void)? = nil) {
        postService.getNextPage { [weak self] remoteResponse in
            for remotePost in remoteResponse {
                self?.posts.append(remotePost)
            }
            if remoteResponse.count > 0 {
                success?(true)
            } else {
                success?(false)
            }
        }
    }
}

// MARK: Getters.
extension PostsViewModel {
    func getPosts() -> [PostViewModelProtocol] {
        return posts
    }

    func getPostsCount() -> Int {
        return posts.count
    }

    func getPostIndex(_ post: PostViewModelProtocol) -> Int? {
        guard let postIndex = posts.firstIndex(where: {$0 === post}) else { return nil }
        return postIndex
    }

    func hasPosts() -> Bool {
        return getPostsCount() > 0
    }
}

// MARK: Remove actions.
extension PostsViewModel {
    @discardableResult
    func remove(_ post: PostViewModelProtocol) -> PostsViewModel {
        if let targetIndex = getPostIndex(post) {
            posts.remove(at: targetIndex)
        }
        return self
    }

    @discardableResult
    func removeAll() -> PostsViewModel {
        posts.removeAll()
        return self
    }
}
