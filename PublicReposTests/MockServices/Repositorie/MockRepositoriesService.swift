//
//  MockRepositoriesService.swift
//  PublicReposTests
//
//  Created by Mariam on 21/09/2024.
//

import XCTest
@testable import PublicRepos

final class MockRepositoriesService: RepositoriesApiProtocol {
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
        guard let url = Bundle(for: type(of: self)).url(forResource: "MockRepositories", withExtension: "json") else {
            throw NSError(domain: "TestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "MockRepositories.json not found"])
        }
        
        let data = try Data(contentsOf: url)
        let repositories = try JSONDecoder().decode([RepositoryModel].self, from: data)
        return repositories
    }
}
