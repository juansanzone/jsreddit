//
//  UserInteractionProtocol.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/28/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

@objc protocol UserInteractionProtocol: NSObjectProtocol {
    func shouldDismissPost(_ post: PostViewModelProtocol)
    func shouldDismissAll()
    func shouldOpenDetail(_ post: PostViewModelProtocol)
    func shouldRefreshList()
}
