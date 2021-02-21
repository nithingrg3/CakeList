//
//  APICakeProtocol.swift
//  CakeItApp
//
//  Created by Nitin George on 20/02/2021.
//

import UIKit

protocol  APICakeProtocol {
    func fetchCakes(completion: @escaping (_ isSuccess: Bool,_ cakeDetails: [Cake]?) -> Void)
    func fetchCakeImage(imageURL: String?, completion: @escaping (_ isSuccess: Bool,_ image: UIImage?) -> Void)
}



