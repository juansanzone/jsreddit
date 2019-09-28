//
//  LocalStorageManager.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/28/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

struct LocalStorageManager {
    internal static func repository() -> UserDefaults {
        return UserDefaults.standard
    }
}

// MARK: Post read/unread status.
extension LocalStorageManager {
    struct Post {
        static let prefix: String = "post_"

        static func isReaded(_ id: String) -> Bool {
            if let readed = repository().object(forKey: "\(prefix)\(id)") as? Bool, readed {
                return readed
            }
            return false
        }

        static func setAsRead(_ id: String) {
            repository().set(true, forKey: "\(prefix)\(id)")
            repository().synchronize()
        }
    }
}
