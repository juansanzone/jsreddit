//
//  DetailViewController+PostLabel.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/28/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import UIKit

/*
    I used Storyboards/Xibs for HomeViewController and PostTableViewCell.
    In this case I'll use UI by code to show my knowledge.
 */
extension DetailViewController {

    func setupPostLabel(bottomOf targetView: UIView) {
        let fontSize: CGFloat = 17
        let topMargin: CGFloat = 24
        let sideMargin: CGFloat = 16
        let postLabel = UILabel()
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        postLabel.textColor = .black
        postLabel.font = UIFont.systemFont(ofSize: fontSize)
        postLabel.textAlignment = .center
        postLabel.numberOfLines = 0
        postLabel.text = post.postText()
        view.addSubview(postLabel)

        NSLayoutConstraint.activate([
            postLabel.topAnchor.constraint(equalTo: targetView.bottomAnchor, constant: topMargin),
            postLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sideMargin),
            postLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sideMargin)
        ])
    }
}
