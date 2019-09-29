//
//  HomeViewController+UserInteractionProtocol.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/27/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import UIKit

// MARK: User Interaction protocol.
// Handler for user actions.
extension HomeViewController: UserInteractionProtocol {

    // Dismiss a post.
    func shouldDismissPost(_ post: PostViewModelProtocol) {
        if let postIndex = viewModel.getPostIndex(post) {
            viewModel = viewModel.remove(post)
            let indexPathToRemove = IndexPath(row: postIndex, section: 0)
            postsTableView.deleteRows(at: [indexPathToRemove], with: UITableView.RowAnimation.left)
            resolveEmptyState()
        }
    }

    // Dismiss all posts.
    func shouldDismissAll() {
        let posts = viewModel.getPosts()
        var currentIndex: Int = 0
        var indexPathsToRemove: [IndexPath] = [IndexPath]()
        for _ in posts {
            indexPathsToRemove.append(IndexPath(row: currentIndex, section: 0))
            currentIndex += 1
        }
        viewModel = viewModel.removeAll()
        postsTableView.deleteRows(at: indexPathsToRemove, with: UITableView.RowAnimation.fade)
        resolveEmptyState()
    }

    @IBAction func didTapOnDismissAll() {
        shouldDismissAll()
    }

    // Open detail.
    func shouldOpenDetail(_ post: PostViewModelProtocol) {
        let detailVC = DetailViewController(withPost: post)
        splitViewController?.showDetailViewController(detailVC, sender: self)
    }

    // User refresh list.
    func shouldRefreshList() {
        getRemotePosts()
    }

    // When the user tap on list image. Open url.
    func shouldOpenUrl(url: String) {
        if let urlToOpen = URL(string: url) {
            UIApplication.shared.open(urlToOpen)
        }
    }
}
