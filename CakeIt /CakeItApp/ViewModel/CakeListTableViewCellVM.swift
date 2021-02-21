//
//  CakeListTableViewCellVM.swift
//  CakeItApp
//
//  Created by Nitin George on 20/02/2021.
//

import UIKit

class CakeListTableViewCellVM: CakeListTableViewCellVMProtocol {
    
    private var apiManager: APICakeProtocol?
    private var cake:Cake?
    
    required init(apiManager: APICakeProtocol, cake: Cake?) {
        self.apiManager = apiManager
        self.cake = cake
    }
    
    func fetchCakeName() -> String? {
        return cake?.title
    }
    
    func fetchCakeDescription() -> String? {
        return cake?.desc
    }
    
    func fetchImage(completion: @escaping (Bool, UIImage?) -> Void) {
        apiManager?.fetchCakeImage(imageURL: cake?.imageURL, completion: { (isSuccess, image) in
            if isSuccess {
                if let image = image {
                    completion(true, image)
                }
                else {
                    completion(true, nil)
                }
            }
            else {
                completion(false, nil)
            }
        })
    }
}
