//
//  Extensions.swift
//  CakeItApp
//
//  Created by Nitin George on 20/02/2021.
//

import Foundation
import UIKit

extension UITableView {
    func setNoContentText(to string: String?) {
        if string != nil {
            let promptLabel = UILabel()
            promptLabel.text = string
            promptLabel.textAlignment = .center
            promptLabel.numberOfLines = 0
            promptLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            promptLabel.textColor = #colorLiteral(red: 0.525480628, green: 0.5979681015, blue: 0.63471663, alpha: 1)
            self.backgroundView = promptLabel
        } else {
            self.backgroundView = nil
        }
    }
}

extension UINavigationController {
    public func presentTransparentNavigationBar() {
        navigationBar.isTranslucent = false
        setNavigationBarHidden(false, animated:true)
    }

    public func hideTransparentNavigationBar() {
        setNavigationBarHidden(true, animated:false)
        navigationBar.setBackgroundImage(UINavigationBar.appearance().backgroundImage(for: UIBarMetrics.default), for:UIBarMetrics.default)
        navigationBar.isTranslucent = UINavigationBar.appearance().isTranslucent
        navigationBar.shadowImage = UINavigationBar.appearance().shadowImage
    }
}

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
