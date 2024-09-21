//
//  RepositoriesApiProtocol.swift
//  PublicRepos
//
//  Created by Mariam on 21/09/2024.
//

import Foundation


protocol RepositoriesApiProtocol {
    func fetchRepositories() async throws -> [RepositoryModel]
}
