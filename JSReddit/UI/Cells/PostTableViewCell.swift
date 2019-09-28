//
//  PostTableViewCell.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/27/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    // MARK: Definitions.
    static let reuseIdentifier: String = "postCell"
    static let xibName: String = "PostTableViewCell"

    // MARK: Protocols.
    private weak var model: PostViewModelProtocol?
    private weak var userInteractionProtocol: UserInteractionProtocol?

    // MARK: Outlets.
    @IBOutlet weak var unReadIndicator: UIView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!

    // MARK: Lifecycle.
    override func prepareForReuse() {
        super.prepareForReuse()
        postImage.image = nil
    }
}

// MARK: Public methods.
extension PostTableViewCell {
    func setupCell(_ viewModel: PostViewModelProtocol) {
        model = viewModel
        postImage.contentMode = .scaleAspectFill
        postImage.setRemoteImage(imageUrl: viewModel.imageUrl())
        unReadIndicator.isHidden = viewModel.isReaded()
        authorLabel.text = viewModel.authorUserName()
        timeAgoLabel.text = viewModel.timeAgo()
        postText.text = viewModel.postText()
        commentsCountLabel.text = "\(viewModel.commentsCount()) comments"
    }

    func setUserInteractionProtocol( _ iProtocol: UserInteractionProtocol) {
        userInteractionProtocol = iProtocol
    }
}

// MARK: User Actions.
private extension PostTableViewCell {
    @IBAction func didTapOnDismissPost() {
        if let targetPost = model {
            userInteractionProtocol?.shouldDismissPost(targetPost)
        }
    }
}
