//
//  DetailViewController.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/28/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    // MARK: Definitions.
    internal let post: PostViewModelProtocol
    internal var galleryManager: SaveGalleryManager?

    // MARK: UI
    internal var postImage: UIImage?

    // MARK: Inits.
    init(withPost: PostViewModelProtocol) {
        self.post = withPost
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGalleryManager()
    }
}

// MARK: Setup/render methods.
private extension DetailViewController {
    func setupUI() {
        /*
          I used Storyboards/Xibs for HomeViewController and PostTableViewCell.
          In this case I'll use UI by code to show my knowledge.
        */
        view.backgroundColor = .white
        setupPostLabel(bottomOf:
            setupPostImage(bottomOf:
                setupUserNameLabel()))
    }

    func setupGalleryManager() {
        galleryManager = SaveGalleryManager(withProtocol: self)
    }
}
