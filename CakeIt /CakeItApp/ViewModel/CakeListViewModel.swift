//
//  CakeListViewModel.swift
//  CakeItApp
//
//  Created by Nitin George on 20/02/2021.
//

import UIKit

class CakeListViewModel: CakeListViewModelProtocol {
    
    private var apiManager: APICakeProtocol?
    private var cakeList: [Cake]?
    
    required init(apiManager: APICakeProtocol) {
        self.apiManager = apiManager
    }

    func fetchNavigationTitle() -> String? {
        return ("🎂 \(NSLocalizedString("CakeItHomeNavTitle", comment: "")) 🍰")
    }
    
    func fetchCakes(completion: @escaping (Bool) -> Void) {
        apiManager?.fetchCakes(completion: { [weak self](isSucess, cakeList) in
            if isSucess {
                guard let cake = cakeList else {
                    completion(true)
                    return
                }
                self?.cakeList = cake
                completion(true)
            }
            else {
                completion(false)
            }
        })
    }
    
    func numberOfRows() -> Int {
        return cakeList?.count ?? 0
    }
    
    func fetchCakeName(selectedIndex: Int) -> String? {
        if let selectedCake = cakeList?[safe:selectedIndex], let name = selectedCake.title {
            return name
        }
        else {
            return nil
        }
    }
    
    func fetchCakeDescription(selectedIndex: Int) -> String? {
        guard let selectedCake = cakeList?[safe:selectedIndex] else {
            return ""
        }
        return selectedCake.desc ?? ""
    }
    
    func fetchSelectedCake(selectedIndex: Int) -> Cake? {
        guard let selectedCake = cakeList?[safe:selectedIndex] else {
            return nil
        }
        return selectedCake
    }
}
