//
//  RepositoryUIModel.swift
//  PublicRepos
//
//  Created by Mariam on 22/09/2024.
//

import Foundation

struct RepositoryRowUIModel: Identifiable {
    let id: Int
    let repoName: String
    let ownerName: String
    let ownerAvatar: String?
    let creationData: String
    
    init(from model: RepositoryModel) {
        id = model.id ?? 0
        repoName = model.name ?? "Name Not Exist"
        ownerName = model.owner?.login ?? "Owner Name Not Exist"
        ownerAvatar = model.owner?.avatarUrl
        creationData = model.formattedCreationDate
    }
}
