//
//  ColorsEnum.swift
//  PublicRepos
//
//  Created by Mariam on 22/09/2024.
//

import SwiftUI

enum AppColors: String, ShapeStyle {
    // we can map figma colors tokens and fonts but this is a sample
    case maincolor = "FFC0CB"
    case headerColor = "ed1273"
    case bodyColor = "000000"
    
    var color: Color {
        var rgb: UInt64 = 0
        Scanner(string: self.rawValue).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        return Color(red: red, green: green, blue: blue)
    }
    var uiColor: UIColor {
        var rgb: UInt64 = 0
        Scanner(string: self.rawValue).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        let alpha: CGFloat = self.rawValue.count == 8 ? CGFloat((rgb & 0xFF000000) >> 24) / 255.0 : 1.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
