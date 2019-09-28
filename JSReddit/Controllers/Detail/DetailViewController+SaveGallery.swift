//
//  DetailViewController+SaveGallery.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/28/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import UIKit

extension DetailViewController: SaveGalleryManagerProtocol {
    func didSaveImage() {
        let alert = UIAlertController(title: "Success =)", message: "Image saved into gallery!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    func saveImageError() {
        let alert = UIAlertController(title: "Error =(", message: "Error saving image into gallery.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
