//
//  AppRouter.swift
//  CakeItApp
//
//  Created by Nitin George on 20/02/2021.
//

import Foundation
import UIKit

enum NavigationState {
    case start
}

final class AppRouter {
    private static var currentState: NavigationState = .start
    
    static func newState(_ state: NavigationState) {
        currentState = state
        switch state {
        case .start:
            if let cakeListVC = sb?.instantiateViewController(withIdentifier: "CakeListViewController") as? CakeListViewController  {
                let navController = UINavigationController(rootViewController: cakeListVC)
                Helper.KeyWindow()?.rootViewController = navController
            }
        }
        Helper.KeyWindow()?.makeKeyAndVisible()
    }
    
    static func pushToCakeDetailScreen(navigationConroller :UINavigationController, selectedCake: Cake?) {
        if let detailVC = sb?.instantiateViewController(withIdentifier: "CakeDetailViewController") as? CakeDetailViewController, let cake = selectedCake  {
            detailVC.cake = cake
            navigationConroller.pushViewController(detailVC,animated: true)
        }
    }
}

