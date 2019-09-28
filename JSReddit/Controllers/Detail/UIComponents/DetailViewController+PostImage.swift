//
//  DetailViewController+PostImage.swift
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
    
    func setupPostImage(bottomOf targetView: UIView) -> UIImageView {
        let size: CGFloat = 120
        let cornerRadius: CGFloat = 3
        let topMargin: CGFloat = 16
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = cornerRadius
        view.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: targetView.bottomAnchor, constant: topMargin),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: size),
            imageView.heightAnchor.constraint(equalToConstant: size)
        ])

        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnImage))
        imageView.addGestureRecognizer(tapGesture)
        
        imageView.setRemoteImage(imageUrl: post.imageUrl()) { [weak self] remoteImage in
            self?.postImage = imageView.image
        }
        return imageView
    }

    @objc func didTapOnImage() {
        galleryManager?.saveImage(postImage)
    }
}
