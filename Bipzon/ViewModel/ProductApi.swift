//
//  ProductApi.swift
//  Bipzon
//
//  Created by Bishwajit Yadav on 25/06/24.
//

import Foundation
import UIKit

class ProductApi {
    
    static let shared = ProductApi()
    private init() {}
    
    func fetchProducts(completion: @escaping (Result<ProductModel, Error>) -> Void) {
        let url = URL(string: "https://dummyjson.com/products")!
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        print(url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }
            
            do {
                let productModel = try JSONDecoder().decode(ProductModel.self, from: data)
                completion(.success(productModel))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }
        
        task.resume()
    }
}
