//
//  CakeListViewModelProtocol.swift
//  CakeItApp
//
//  Created by Nitin George on 20/02/2021.
//

import UIKit

protocol  CakeListViewModelProtocol {
    func fetchNavigationTitle() -> String?
    func fetchCakes(completion: @escaping (_ isSuccess: Bool) -> Void)
    func numberOfRows() -> Int
    func fetchSelectedCake(selectedIndex: Int) -> Cake?
}
