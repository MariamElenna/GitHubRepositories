//
//  RepositoryOwnerModel.swift
//  PublicRepos
//
//  Created by Mariam on 19/09/2024.
//

import Foundation

struct RepositoryOwnerModel: Decodable {
    let avatarUrl: String?
    let id: Int?
    let userName: String?

    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case id = "id"
        case userName = "login"
    }
}
