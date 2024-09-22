//
//  RepositoryRowView.swift
//  PublicRepos
//
//  Created by Mariam on 22/09/2024.
//

import SwiftUI

struct RepositoryRowView: View {
    let repository: RepositoryRowUIModel // Parameter to accept the object

    var body: some View {
        HStack {
            // Repository owner avatar
            if let avatarURL = repository.ownerAvatar,
               let url = URL(string: avatarURL) {
                CachedAsyncImage(url: url) {
                    ProgressView() // Placeholder while loading
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading) {
                // Repository name
                Text(repository.repoName)
                    .font(.headline)
                
                // Owner name
                Text("Owner: " + "\(repository.ownerName)")
                    .font(.subheadline)
                
                // Created date formatted
                Text("Created At: " + "\(repository.creationData)")
                    .font(.subheadline)
            }
        }
    }
}
