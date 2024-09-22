//
//  RepositoryDetailsUIModel.swift
//  PublicRepos
//
//  Created by Mariam on 22/09/2024.
//

import Foundation

struct RepositoryDetailsUIModel {
    let id: Int
    let repoName: String
    let ownerName: String
    let ownerAvatar: String?
    let description: String
    let creationData: String?

    
    init(from model: RepositoryModel) {
        id = model.id
        repoName = model.name ?? "Name Not Exist"
        ownerName = model.owner.userName ?? "Owner Name Not Exist"
        ownerAvatar = model.owner.avatarUrl
        description = model.descriptionField ?? "No Description"
        creationData = model.createdAt
    }

}
