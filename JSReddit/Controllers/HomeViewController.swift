//
//  HomeViewController.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/27/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: Outlets.
    @IBOutlet weak var postsTableView: UITableView!

    // MARK: Definitions.
    internal var viewModel = PostViewModel()

    // MARK: Lifecycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

// MARK: Setup methods.
private extension HomeViewController {
    func setupTableView() {
        let estimatedRowHeight: CGFloat = 400
        let bottomContentInset: CGFloat = 44
        postsTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
        postsTableView.register(UINib(nibName: PostTableViewCell.xibName, bundle: nil), forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
        postsTableView.estimatedRowHeight = estimatedRowHeight
        postsTableView.rowHeight = UITableView.automaticDimension
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomContentInset, right: 0)
    }
}
