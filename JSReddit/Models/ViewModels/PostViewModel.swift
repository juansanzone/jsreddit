//
//  PostViewModel.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/27/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

struct PostViewModel {
    private let posts: [PostViewModelProtocol] = [PostMock1(), PostMock2(), PostMock3()]
    func getPosts() -> [PostViewModelProtocol] {
        return posts
    }
}
