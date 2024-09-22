//
//  RepositoryUIModel.swift
//  PublicRepos
//
//  Created by Mariam on 22/09/2024.
//

import Foundation

struct RepositoryUIModel: Identifiable {

    let id: Int
    let repoName: String
    let fullName: String
    let ownerName: String
    let ownerAvatar: String?
    let formatedCreationDate: String

    init(from model: RepositoryModel) {
        id = model.id
        repoName = model.name ?? "Name Not Exist"
        fullName = model.fullName ?? ""
        ownerName = model.owner.userName ?? "Owner Name Not Exist"
        ownerAvatar = model.owner.avatarUrl
        formatedCreationDate = (model.createdAt ?? "").formattedDate
    }
}
