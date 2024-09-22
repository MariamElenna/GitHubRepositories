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
    let fullName: String
    let ownerName: String
    let ownerAvatar: String?
    let creationData: String
    
    init(from model: RepositoryModel) {
        id = model.id ?? 0
        repoName = model.name ?? "Name Not Exist"
        fullName = model.fullName ?? ""
        ownerName = model.owner?.login ?? "Owner Name Not Exist"
        ownerAvatar = model.owner?.avatarUrl
        creationData = model.formattedCreationDate
    }
}
