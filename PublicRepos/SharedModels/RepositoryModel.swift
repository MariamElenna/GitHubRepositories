//
//  RepositoryModel.swift
//  PublicRepos
//
//  Created by Mariam on 19/09/2024.
//

import Foundation

struct RepositoryModel: Decodable {
    let createdAt: String?
    let descriptionField: String?
    let fullName: String?
    let id: Int
    let name: String?
    let owner: RepositoryOwnerModel
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case descriptionField = "description"
        case fullName = "full_name"
        case id = "id"
        case name = "name"
        case owner
        case updatedAt = "updated_at"
    }
}
