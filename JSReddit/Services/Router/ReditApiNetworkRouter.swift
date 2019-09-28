//
//  ReditApiNetworkRouter.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/28/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

enum ReditApiNetworkRouter {
    case getTopPosts

    var scheme: String {
        return "https"
    }

    var host: String {
        return "www.reddit.com"
    }

    var path: String {
        switch self {
        case .getTopPosts:
            return "top/.json"
        }
    }

    var parameters: [URLQueryItem] {
        switch self {
        case .getTopPosts:
            return [URLQueryItem(name: "limit", value: "50")]
        }
    }

    var method: String {
        switch self {
        case .getTopPosts:
            return "GET"
        }
    }
}
