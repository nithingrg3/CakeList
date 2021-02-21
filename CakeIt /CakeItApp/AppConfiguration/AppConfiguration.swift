//
//  AppConfiguration.swift
//  CakeItApp
//
//  Created by Nitin George on 20/02/2021.
//

import Foundation

enum AppConfiguration {

    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()

    static let apiURL: String = {
      guard let api_url = AppConfiguration.infoDictionary["API_URL"] as? String else {
        fatalError("API Key not set in plist for this environment")
      }
      return api_url
    }()
}
