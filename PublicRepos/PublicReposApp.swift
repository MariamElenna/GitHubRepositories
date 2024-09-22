//
//  PublicReposApp.swift
//  PublicRepos
//
//  Created by Mariam on 19/09/2024.
//

import SwiftUI

@main
struct PublicReposApp: App {
    init() {
        // Customize navigation bar appearance
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = AppColors.maincolor.uiColor
        appearance.buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black] // Change button color
        // Apply appearance settings
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .black
    }
    var body: some Scene {
        WindowGroup {
            RepositoriesView()
        }
    }
}
