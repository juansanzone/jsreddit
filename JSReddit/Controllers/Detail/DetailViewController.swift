//
//  DetailViewController.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/28/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    private let post: PostViewModelProtocol

    init(withPost: PostViewModelProtocol) {
        self.post = withPost
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension DetailViewController {
    func setupUI() {
        print(post.authorUserName())
    }
}
