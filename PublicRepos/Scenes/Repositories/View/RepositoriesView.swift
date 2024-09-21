//
//  RepositoriesView.swift
//  PublicRepos
//
//  Created by Mariam on 20/09/2024.
//

import SwiftUI

struct RepositoriesView: View {
    @StateObject private var viewModel = RepositoriesViewModel() // Use @StateObject to initialize and own the ViewModel
    init() {
        // Customize navigation bar appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = AppColors.maincolor.color
        
        // Apply appearance settings
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
        NavigationView {
            List(viewModel.repositories) { repository in // Use repositories from ViewModel
                NavigationLink(destination: RepositoryDetailsView(fullName: repository.fullName ?? "")) { // Link to Detail View
                    HStack {
                        // Repository owner avatar
                        if let avatarURL = repository.owner?.avatarUrl,
                           let url = URL(string: avatarURL) {
                            CachedAsyncImage(url: url) {
                                ProgressView() // Placeholder while loading
                            }
                            .frame(width: 50, height: 50)
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        }
                        
                        VStack(alignment: .leading) {
                            // Repository name
                            Text(repository.name ?? "")
                                .font(.headline)
                            
                            // Owner name
                            Text("Owner: \(repository.owner?.login ?? "")")
                                .font(.subheadline)
                            
                            // Created date formatted
                            Text("Created At: OPEN DETAILS")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Repositories")
            .onAppear {
                viewModel.fetchRepositories() // Call fetch function when the view appears
            }
            .overlay(
                Group {
                    if viewModel.isLoading {
                        ProgressView("Loading...") // Show loading indicator
                    } else if let error = viewModel.error {
                        Text(error.localizedDescription)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                    }
                }
            )
        }
    }
}
#Preview {
    RepositoriesView()
}
