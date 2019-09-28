//
//  NetworkService.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/28/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

struct NetworkService {

    static func request<T: Codable>(router: ReditApiNetworkRouter, completion: @escaping (Result<T, Error>) -> ()) {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters

        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method

        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in

            guard error == nil else {
                completion(.failure(error!))
                // print(error?.localizedDescription)
                return
            }
            guard response != nil else {
                return
            }
            guard let data = data else {
                return
            }

            let responseObject = try! JSONDecoder().decode(T.self, from: data)

            DispatchQueue.main.async {
                completion(.success(responseObject))
            }
        }
        dataTask.resume()
    }
}
