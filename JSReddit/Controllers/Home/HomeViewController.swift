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
    private let pullToRefresh = UIRefreshControl()

    // MARK: Definitions.
    internal var viewModel = PostViewModel()

    // MARK: Lifecycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupPullToRefresh()
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

    func setupPullToRefresh() {
        let font = UIFont.systemFont(ofSize: 12)
        let attributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.white]
        pullToRefresh.tintColor = .white
        pullToRefresh.attributedTitle = NSAttributedString(string: "Updating ...", attributes: attributes)
        pullToRefresh.addTarget(self, action: #selector(shouldRefreshList), for: .valueChanged)
        postsTableView.refreshControl = pullToRefresh
    }
}