//
//  UIColor+Extension.swift
//  PublicRepos
//
//  Created by Mariam on 22/09/2024.
//

import SwiftUI

extension UIColor {
    convenience init(appColor: AppColors) {
        let components = appColor.uiColor.cgColor.components
        let red = components?[0] ?? 0
        let green = components?[1] ?? 0
        let blue = components?[2] ?? 0
        let alpha = (components?.count == 4 ? components?[3] : 1.0) ?? 1.0

        self.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
}
