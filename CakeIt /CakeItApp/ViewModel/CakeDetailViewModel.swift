//
//  CakeDetailViewModel.swift
//  CakeItApp
//
//  Created by Nitin George on 20/02/2021.
//

import UIKit

class CakeDetailViewModel: CakeDetailViewModelProtocol {

    private var apiManager: APICakeProtocol?
    private var cake: Cake?
    
    required init(apiManager: APICakeProtocol, cake: Cake?) {
        self.apiManager = apiManager
        self.cake = cake
    }
    
    func fetchNavigationTitle() -> String? {
        return ("Detail")
    }
    
    func numberOfRows() -> Int {
        //Need to write the Bussiness logic in the future. Retrun 1 row for Title and 1 for Description
        return 2
    }
    
    func headerViewHeight() -> CGFloat {
        return CGFloat(kCakeDetailImageHeight)
    }
    
    func fetchCakeName() -> String? {
        return cake?.title ?? nil
    }
    
    func fetchCakeImage(completion: @escaping (Bool, UIImage?) -> Void) {
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
    
    func fetchCakeDescription() -> String? {
        return cake?.desc ?? nil
    }
}

