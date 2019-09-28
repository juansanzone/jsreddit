//
//  SaveGalleryManager.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/28/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import UIKit

class SaveGalleryManager {
    private weak var managerProtocol: SaveGalleryManagerProtocol?

    init(withProtocol: SaveGalleryManagerProtocol) {
        managerProtocol = withProtocol
    }

    func saveImage(_ image: UIImage?) {
        guard let imageToSave = image else {
            managerProtocol?.saveImageError()
            return
        }
        UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
        managerProtocol?.didSaveImage()
    }
}
