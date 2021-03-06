//
//  Service.swift
//  iOSApp-MVVM
//
//  Created by Inaldo Ramos Ribeiro on 22/02/2020.
//  Copyright © 2020 Inaldo's Software Development. All rights reserved.
//

import Foundation

class Service: NSObject {
    static let shared = Service()
    
    func fetchItems(completion: @escaping (Item?, APIError?) -> ()) {
        let urlString = "\(APIConstants.baseURL)contentList.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, APIError.requestFailed)
                print("Failed to fetch items:", err)
                return
            }
            
            // check response
            
            guard let data = data else { return }
            do {
                let items = try JSONDecoder().decode(Item.self, from: data)
                DispatchQueue.main.async {
                    completion(items, nil)
                }
            } catch {
                print("Failed to decode:", APIError.parsingFailed)
            }
            }.resume()
    }
    
    func fetchItemDetails(completion: @escaping (ItemDetail?, APIError?) -> ()) {
        let ok = "35"
        let urlString = "\(APIConstants.baseURL)content/\(ok).json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, APIError.requestFailed)
                print("Failed to fetch items:", err)
                return
            }
            
            // check response
            
            guard let data = data else { return }
            do {
                let itemDetail = try JSONDecoder().decode(ItemDetail.self, from: data)
                DispatchQueue.main.async {
                    completion(itemDetail, nil)
                }
            } catch {
                print("Failed to decode:", APIError.parsingFailed)
            }
            }.resume()
    }
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        