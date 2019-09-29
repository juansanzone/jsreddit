//
//  RedditPostsService.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/28/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

struct RedditPostsService {
    let paramsRepository = RedditPostsServiceRepository()
}

// MARK: Top Posts.
extension RedditPostsService {
    func getTopPosts(success: (([PostViewModelProtocol])->Void)? = nil) {
        NetworkService.request(router: ReditApiNetworkRouter.getTopPosts) { (result: Result<RedditResponseDto, Error>) in
            switch result {
            case .success(let mainResponse):
                var postsResponse = [PostViewModelProtocol]()
                let posts = mainResponse.data.children
                self.paramsRepository.setNextPage(mainResponse.data.nextPage)
                for post in posts {
                    let targetPost = post.post
                    postsResponse.append(PostModel(id: targetPost.id, userName: targetPost.author_fullname, imageUrl: targetPost.thumbnail, text: targetPost.title, commentsCount: targetPost.num_comments, timestamp: targetPost.created, url: targetPost.url))
                }
                success?(postsResponse)
            case .failure:
                #if DEBUG
                    print(result)
                #endif
            }
        }
    }
}

// MARK: Next Page.
extension RedditPostsService {
    func getNextPage(success: (([PostViewModelProtocol])->Void)? = nil) {
        if let nextPage = paramsRepository.getNextPage() {
            NetworkService.request(router: ReditApiNetworkRouter.getNextPage(nextPage)) { (result: Result<RedditResponseDto, Error>) in
                switch result {
                case .success(let mainResponse):
                    var postsResponse = [PostViewModelProtocol]()
                    let posts = mainResponse.data.children
                    self.paramsRepository.setNextPage(mainResponse.data.nextPage)
                    for post in posts {
                        let targetPost = post.post
                        postsResponse.append(PostModel(id: targetPost.id, userName: targetPost.author_fullname, imageUrl: targetPost.thumbnail, text: targetPost.title, commentsCount: targetPost.num_comments, timestamp: targetPost.created, url: targetPost.url))
                    }
                    success?(postsResponse)
                case .failure:
                    #if DEBUG
                        print(result)
                    #endif
                }
            }
        } else {
            success?([PostViewModelProtocol]())
        }
    }
}
