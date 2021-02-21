//
//  CakeServicesMock.swift
//  CakeItAppTests
//
//  Created by Nitin George on 20/02/2021.
//

import Foundation
import UIKit

final class CakeServicesMock: APICakeProtocol {
    
    func fetchCakeImage(imageURL: String?, completion: @escaping (Bool, UIImage?) -> Void) {
        completion(false,nil)
    }
    
    func fetchCakes(completion: @escaping (Bool, [Cake]?) -> Void) {
        var apiResult:Data?
        do {
            apiResult = try Data.init(contentsOf: Bundle.main.url(forResource: "MockCake", withExtension: "json")!)
            if let apiResult = apiResult {
                let cakes = try JSONDecoder().decode([Cake].self, from: apiResult)
                completion(true, cakes)
            }
        } catch _ as NSError {
            completion(false, nil)
        }
    }
}
