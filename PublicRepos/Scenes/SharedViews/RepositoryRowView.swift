//
//  RepositoryRowView.swift
//  PublicRepos
//
//  Created by Mariam on 22/09/2024.
//

import SwiftUI

struct RepositoryRowView: View {
    var repository: RepositoryUIModel

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
                Text("Owner: \(repository.ownerName)")
                    .font(.subheadline)

                // Created date formatted
                Text("Created At: \(repository.formatedCreationDate)")
                    .font(.subheadline)
            }
        }
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    let mockRepository = RepositoryModel(
        createdAt: "2024-01-01T12:00:00Z",
        descriptionField: "This is a sample repository description.",
        fullName: "owner/Sample Repository",
        id: 1,
        name: "Sample Repository",
        owner: RepositoryOwnerModel(avatarUrl: "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250", id: 111, userName: "John Doe"),
        updatedAt: "2024-01-10T12:00:00Z"
    )

    let repositoryUIModel = RepositoryUIModel(from: mockRepository)

    return RepositoryRowView(repository: repositoryUIModel)

}
