//
//  Environments.swift
//  PublicRepos
//
//  Created by Mariam on 20/09/2024.
//

import Foundation

struct Environments {
    // an enum to centralize all info.plist keys
    private enum Keys: String {
        case baseUrl = "Base URL"
    }

    private let infoDictionary: [String: Any]
    /* or we can declare it like that
     If cannot find Info.plist, simply crash as it is a developer error and should never happen
     private static let infoDictionary: [String: Any] = Bundle.main.infoDictionary!
     but i don't like to use static as it work as global constant
     or configuration value and i like error handling more*/

    init() {
        guard let infoDict = Bundle.main.infoDictionary else {
            fatalError("Info.plist not found.")
        }
        self.infoDictionary = infoDict
    }

    var baseUrl: String {
        guard let url = infoDictionary[Keys.baseUrl.rawValue] as? String else {
            fatalError("Base URL not set in Info.plist.")
        }
        return url
    }
}
