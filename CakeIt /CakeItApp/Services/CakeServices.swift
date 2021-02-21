//
//  CakeServices.swift
//  CakeItApp
//
//  Created by Nitin George on 20/02/2021.
//

import Foundation
import UIKit

final class CakeServices: APICakeProtocol {
    
    static var imageCache = NSCache<NSString, UIImage>()
    
    func fetchCakes(completion: @escaping (Bool, [Cake]?) -> Void) {
        let url = URL(string: "\(AppConfiguration.apiURL)\(kFetchCakeListURL)")!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let decodedResponse = try? JSONDecoder().decode([Cake].self, from: data!) {
                completion(true, decodedResponse)
            }
            else {
                completion(false, nil)
            }
        }.resume()
    }
    
    func fetchCakeImage(imageURL: String?, completion: @escaping (Bool, UIImage?) -> Void) {
        if let image = CakeServices.imageCache.object(forKey: imageURL! as NSString) {
            completion(true, image)
        }
        else {
            if let url = imageURL, let convertedURL = URL(string: url)  {
                let request = URLRequest(url: convertedURL)
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let imageData = data, let image = UIImage(data: imageData) {
                        CakeServices.imageCache.setObject(image, forKey: url as NSString)
                        completion(true, image)
                    }
                    else {
                        completion(true, nil)
                    }
                }.resume()
            }
            else {
                completion(false,nil)
            }
        }
    }
}

