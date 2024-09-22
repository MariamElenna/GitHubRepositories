//
//  RepositoriesView.swift
//  PublicRepos
//
//  Created by Mariam on 20/09/2024.
//

import SwiftUI

struct RepositoriesView: View {

    // Use @StateObject to initialize and own the ViewModel and the viewmodel has view lifecycle
    /* i didn't use @ObservedObject
     because i don't want to init viewmodel else where,
     or be owned by something else other than the view*/
    @StateObject private var viewModel = RepositoriesViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.repositories) { repository in
                NavigationLink(
                    destination: RepositoryDetailsView(fullName: repository.fullName)
                ) { // Link to Detail View
                    RepositoryRowView(repository: repository)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Repositories")
            .task {
                await viewModel.fetchRepositories()
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
        }.accentColor(Color(UIColor.label))
    }
}

#Preview {
    RepositoriesView()
}
