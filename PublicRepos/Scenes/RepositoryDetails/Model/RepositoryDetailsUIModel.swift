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
    let creationData: String
    let updateDate: String
    let networkCount: String
    let openIssuesCount: String
    let subscribersCount: String
    
    init(from model: RepositoryModel) {
        id = model.id ?? 0
        repoName = model.name ?? "Name Not Exist"
        ownerName = model.owner?.login ?? "Owner Name Not Exist"
        ownerAvatar = model.owner?.avatarUrl
        description = model.descriptionField ?? "No Description"
        creationData = model.formattedCreationDate
        updateDate = model.formattedUpdateDate
        networkCount = model.networkCount?.toString ?? "0"
        openIssuesCount = model.openIssuesCount?.toString ?? "0"
        subscribersCount = model.subscribersCount?.toString ?? "0"
    }
}
