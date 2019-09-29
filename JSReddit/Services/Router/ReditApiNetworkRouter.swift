//
//  ReditApiNetworkRouter.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/28/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

enum ReditApiNetworkRouter {
    static let initialLimit: Int = 10
    static let limitPerPage: Int = 4

    case getTopPosts
    case getNextPage(String)

    var scheme: String {
        return "https"
    }

    var host: String {
        return "www.reddit.com"
    }

    var path: String {
        switch self {
        case .getTopPosts, .getNextPage:
            return "/top/.json"
        }
    }

    var parameters: [URLQueryItem] {
        switch self {
        case .getTopPosts:
            return [URLQueryItem(name: "limit", value: String(ReditApiNetworkRouter.initialLimit))]
        case .getNextPage(let page):
            return [URLQueryItem(name: "limit", value: String(ReditApiNetworkRouter.limitPerPage)), URLQueryItem(name: "after", value: page)]
        }
    }

    var method: String {
        switch self {
        case .getTopPosts, .getNextPage:
            return "GET"
        }
    }
}
