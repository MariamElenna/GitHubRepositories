//
//  RepositoryDetailsView.swift
//  PublicRepos
//
//  Created by Mariam on 20/09/2024.
//

import SwiftUI

struct RepositoryDetailsView: View {
    @StateObject private var viewModel = RepositoryDetailsViewModel()
    var fullName: String
    init(fullName: String) {
        self.fullName = fullName
    }
    var body: some View {
        VStack(spacing: 10) {
            if let repository = viewModel.repository {
                // Repository owner avatar
                if let avatarURL = repository.owner?.avatarUrl,
                   let url = URL(string: avatarURL) {
                    CachedAsyncImage(url: url) {
                        ProgressView() // Placeholder while loading
                    }
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                Text("Owner: \(repository.owner?.login ?? "Unknown")")
                    .font(.title2)
                if let description = repository.descriptionField {
                    Text(description)
                        .font(.body)
                        .padding(.top)
                }
                Text("Created on: \(viewModel.formattedDate(from: repository.createdAt))")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            Spacer()
        }.onAppear {
            viewModel.fetchRepositoryDetails(fullName: fullName )
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .overlay(
            Group {
                if viewModel.isLoading {
                    ProgressView() // Show loading indicator
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                }
            }
        )
    }
}

#Preview {
    RepositoryDetailsView(fullName: "mojombo/grit")
}
