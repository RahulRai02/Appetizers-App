//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Rahul Rai on 04/11/23.
//

import Foundation
import UIKit

final class NetworkManager{
    
    // Basic structure for setting up network manager
    
    static let shared = NetworkManager()
    // URL-Image key value pair cache
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "http://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void){
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            // Unwrap optionals
            
            // Used if let because error has some value which means some error occured...
            // Earlier i was using guard let, that means if there is no error it was stopping the application
            if let _ = error{
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else{
                completed(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch{
                completed(.failure(.invalidData))
            }
        }
        // To fire of the network call
        task.resume()
    }

    func downloadImage(fromURLString: String, completed: @escaping(UIImage?) -> Void){
        let cacheKey = NSString(string: fromURLString)
        
        // Check image in cache, if present the return completion handler with image
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let url = URL(string: fromURLString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            // Check if data is not nil, if not then good make a UIImage out of that else return nil
            guard let data = data, let image = UIImage(data: data) else{
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
    
}
