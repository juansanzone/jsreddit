//
//  RedditPostsService.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/28/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

struct RedditPostsService {

    func getTopPosts(success: (([PostViewModelProtocol])->Void)? = nil) {
        NetworkService.request(router: ReditApiNetworkRouter.getTopPosts) { (result: Result<RedditResponseDto, Error>) in
            switch result {
            case .success(let mainResponse):
                var postsResponse = [PostViewModelProtocol]()
                let posts = mainResponse.data.children
                for post in posts {
                    let targetPost = post.post
                    postsResponse.append(PostModel(id: targetPost.id, userName: targetPost.author_fullname, imageUrl: targetPost.thumbnail, text: targetPost.title, commentsCount: targetPost.num_comments, timestamp: targetPost.created))
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
