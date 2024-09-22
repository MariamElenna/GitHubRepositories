//
//  RepositoriesService.swift
//  PublicRepos
//
//  Created by Mariam on 21/09/2024.
//

import Foundation

final class RepositoriesService: RepositoriesProtocol {
    func fetchRepositories() async throws -> [RepositoryModel] {
        return try await APIRouter.getRepositories.performRequest([RepositoryModel].self)
    }
}
