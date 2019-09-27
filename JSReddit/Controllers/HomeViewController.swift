//
//  HomeViewController.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/27/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    @IBOutlet weak var postsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

// MARK: Setup methods.
private extension HomeViewController {
    func setupTableView() {
        let estimatedRowHeight: CGFloat = 300
        postsTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
        postsTableView.register(UINib(nibName: PostTableViewCell.xibName, bundle: nil), forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
        postsTableView.estimatedRowHeight = estimatedRowHeight
        postsTableView.rowHeight = UITableView.automaticDimension
        postsTableView.delegate = self
        postsTableView.dataSource = self
    }
}
