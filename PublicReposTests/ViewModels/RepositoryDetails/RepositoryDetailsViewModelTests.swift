//
//  RepositoryDetailsViewModelTests.swift
//  PublicReposTests
//
//  Created by Mariam on 21/09/2024.
//

import XCTest
@testable import PublicRepos

final class RepositoryDetailsViewModelTests: XCTestCase {
    var viewModel: RepositoryDetailsViewModel!
    var mockService: MockRepositoryDetailsService!
    
    override func setUp() {
        super.setUp()
        mockService = MockRepositoryDetailsService()
        viewModel = RepositoryDetailsViewModel(repositoryDetailsService: mockService)
    }

    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }

    // Test fetching repository details successfully
    func testFetchRepositoryDetailsSuccess() async throws {
        let repo: RepositoryModel = try await mockService.fetchRepositoryDetails(fullName: "mojombo/grit")
        XCTAssertNotNil(repo, "Repository details should not be nil")
    }
    
    func testFetchRepositoryDetailsFailure() async throws {
        do {
            // When: Fetching repository details
            let repo = try await mockService.fetchRepositoryDetails(fullName: "some-repo")
            XCTAssertNil(repo, "Repository details should be nil")
            XCTFail("Expected to throw an error, but got success")
        } catch {
            // Then: Verify that the correct error is thrown
            XCTAssertEqual((error.localizedDescription), APIError.networkError(URLError(.badURL)).localizedDescription, "Error code should match")
        }
    }
}
