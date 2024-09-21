//
//  MockRepositoryDetailsService.swift
//  PublicReposTests
//
//  Created by Mariam on 21/09/2024.
//

import XCTest
@testable import PublicRepos

final class MockRepositoryDetailsService: RepositoryDetailsApiProtocol {
    var error: APIError?
    
    func fetchRepositoryDetails(fullName: String) async throws -> PublicRepos.RepositoryDetailsModel {
        // Load mock data from JSON file
        let repo = try loadMockRepositoryDetails()
        if repo.fullName == fullName {
            return repo
        } else {
            throw APIError.networkError((URLError(.badURL)))
        }
    }
    // Helper method to load JSON data
    private func loadMockRepositoryDetails() throws -> RepositoryDetailsModel {
        guard let url = Bundle(for: type(of: self)).url(forResource: "MockRepositoryDetails", withExtension: "json") else {
            throw NSError(domain: "TestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "MockRepositories.json not found"])
        }
        
        let data = try Data(contentsOf: url)
        let repo = try JSONDecoder().decode(RepositoryDetailsModel.self, from: data)
        return repo
    }
}
