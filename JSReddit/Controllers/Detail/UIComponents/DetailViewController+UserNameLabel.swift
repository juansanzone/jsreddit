//
//  DetailViewController+UserNameLabel.swift
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
    
    func setupUserNameLabel() -> UILabel {
        let fontSize: CGFloat = 24
        let margin: CGFloat = 16
        let userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.textColor = .black
        userNameLabel.font = UIFont.systemFont(ofSize: fontSize)
        userNameLabel.textAlignment = .left
        userNameLabel.numberOfLines = 1
        userNameLabel.text = post.authorUserName()
        view.addSubview(userNameLabel)

        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        return userNameLabel
    }
}
