//
//  MockRepositoriesService.swift
//  PublicReposTests
//
//  Created by Mariam on 21/09/2024.
//

import XCTest
@testable import PublicRepos

final class MockRepositoriesService: RepositoriesProtocol {
    var shouldFail = false
    var error: APIError?

    func fetchRepositories() async throws -> [RepositoryModel] {
        if shouldFail {
            if let error = error {
                throw error
            } else {
                throw APIError.unknownError
            }
        }

        // Load mock data from JSON file
        return try await loadMockRepositories()
    }

    // Helper method to load JSON data
    private func loadMockRepositories() async throws -> [RepositoryModel] {
        let data = DataLoader().loadJsonData(file: .repositoriesFile)!
        let repositories = try JSONDecoder().decode([RepositoryModel].self, from: data)
        return repositories
    }
}
