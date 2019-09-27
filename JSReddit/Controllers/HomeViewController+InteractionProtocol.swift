//
//  HomeViewController+UserInteractionProtocol.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/27/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

// MARK: Interaction protocol.
// Handler of dismiss action.
extension HomeViewController: PostCellInteractionProtocol {
    func shouldDismissPost(_ post: PostViewModelProtocol) {
        viewModel = viewModel.remove(post)
    }

    func shouldDismissAll() {
        viewModel = viewModel.removeAll()
    }
}
