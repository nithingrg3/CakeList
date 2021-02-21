//
//  CakeListTableViewCellVMProtocol.swift
//  CakeItApp
//
//  Created by Nitin George on 20/02/2021.
//

import UIKit

protocol CakeListTableViewCellVMProtocol {
    func fetchImage(completion: @escaping (_ isSuccess: Bool,_ image: UIImage?) -> Void)
    func fetchCakeName() -> String?
    func fetchCakeDescription() -> String?
}
