//
//  CakeDetailViewModelProtocol.swift
//  CakeItApp
//
//  Created by Nitin George on 20/02/2021.
//

import UIKit

protocol CakeDetailViewModelProtocol {
    func fetchNavigationTitle() -> String?
    func numberOfRows() -> Int
    func headerViewHeight() -> CGFloat
    func fetchCakeName() -> String?
    func fetchCakeImage(completion: @escaping (_ isSuccess: Bool,_ image: UIImage?) -> Void)
    func fetchCakeDescription() -> String?
}

