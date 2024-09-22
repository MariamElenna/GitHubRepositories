//
//  MockRepositoryDetailsService.swift
//  PublicReposTests
//
//  Created by Mariam on 21/09/2024.
//

import XCTest
@testable import PublicRepos

final class MockRepositoryDetailsService: RepositoryDetailsProtocol {
    var error: APIError?

    func fetchRepositoryDetails(fullName: String) async throws -> PublicRepos.RepositoryModel {
        // Load mock data from JSON file
        let repo = try loadMockRepositoryDetails()
        if repo.fullName == fullName {
            return repo
        } else {
            throw APIError.networkError((URLError(.badURL)))
        }
    }
    // Helper method to load JSON data
    private func loadMockRepositoryDetails() throws -> RepositoryModel {
        let data = DataLoader().loadJsonData(file: .repoDetailsFile)!
        let repo = try JSONDecoder().decode(RepositoryModel.self, from: data)
        return repo
    }
}
