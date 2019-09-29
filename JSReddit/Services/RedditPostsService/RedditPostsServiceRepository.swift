//
//  RedditPostsServiceRepository.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/29/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

// MARK: Manage contexts service params.
class RedditPostsServiceRepository {
    private var nextPage: String?

    func setNextPage(_ page: String?) {
        self.nextPage = page
    }
    func getNextPage() -> String? {
        return nextPage
    }
}
