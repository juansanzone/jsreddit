//
//  RedditPostsService.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/28/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

struct RedditPostsService {

    func getTopPosts(success:(([RedditChildrenResponseDto])->Void)? = nil) {
        NetworkService.request(router: ReditApiNetworkRouter.getTopPosts) { (result: Result<RedditResponseDto, Error>) in
            switch result {
            case .success(let mainResponse):
                success?(mainResponse.data.children)
            case .failure:
                #if DEBUG
                    print(result)
                #endif
            }
        }
    }
}
