//
//  DataLoader.swift
//  PublicReposTests
//
//  Created by Mariam on 22/09/2024.
//

import Foundation

final class DataLoader {

    func loadJsonData(file: MockFiles) -> Data? {

        if let jsonFilePath = Bundle(for: type(of: self)).path(forResource: file.rawValue, ofType: "json") {
            let jsonFileURL = URL(fileURLWithPath: jsonFilePath)

            if let jsonData = try? Data(contentsOf: jsonFileURL) {
                return jsonData
            }
        }

        return nil
    }
}
