//
//  HomeViewController+TableView.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/27/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import UIKit

// MARK: TableView protocols.
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getPostsCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let targetCell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath) as? PostTableViewCell {
            let targetPost = viewModel.getPosts()[indexPath.row]
            targetCell.setupCell(targetPost)
            targetCell.setUserInteractionProtocol(self)
            return targetCell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    // Handle user tap on post detail.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > viewModel.getPostsCount() { return }
        if let targetCell = tableView.cellForRow(at: indexPath) as? PostTableViewCell {
            targetCell.hideUnReadIndicator()
        }
        let targetPost = viewModel.getPosts()[indexPath.row]
        shouldOpenDetail(targetPost)
    }
}
