//
//  UIColor+Hex.swift
//  PublicRepos
//
//  Created by Mariam on 22/09/2024.
//

import SwiftUI

extension UIColor {

    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)

        // Skip the '#' character if present
        if hex.hasPrefix("#") {
            scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
        }

        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
