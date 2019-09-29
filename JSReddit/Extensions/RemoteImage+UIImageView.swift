//
//  RemoteImage+UIImageView.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/27/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import UIKit

// Extension to get and show remote image. Using local cache.
extension UIImageView {
    func setRemoteImage(imageUrl: String, placeHolderRadius: CGFloat = 3, success:((UIImage)->Void)? = nil) {
        guard let url = URL(string: imageUrl) else { return }
        let cache = URLCache.shared
        let request = URLRequest(url: url)
        let defaultCornerRadius: CGFloat = 3

        if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            self.image = image
            self.backgroundColor = .clear
            self.layer.masksToBounds = true
            self.layer.cornerRadius = defaultCornerRadius
            success?(image)
        } else {
            self.layer.cornerRadius = placeHolderRadius
            self.backgroundColor = UIColor.gray
            self.layer.masksToBounds = true
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
                    let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak self] in
                        DispatchQueue.main.async {
                            self?.backgroundColor = .clear
                            self?.layer.cornerRadius = defaultCornerRadius
                            self?.image = image
                        }}, completion: { _ in
                            success?(image)
                    }
                    )}
            }).resume()
        }
    }
}
