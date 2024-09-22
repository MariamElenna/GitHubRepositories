//
//  RepositoriesViewModelTests.swift
//  PublicReposTests
//
//  Created by Mariam on 21/09/2024.
//

import XCTest
@testable import PublicRepos

final class RepositoriesViewModelTests: XCTestCase {
    var viewModel: RepositoriesViewModel!
    var mockService: MockRepositoriesService!

    override func setUp() {
        super.setUp()
        mockService = MockRepositoriesService()
        viewModel = RepositoriesViewModel(repositoriesService: mockService)
    }
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }

    func testFetchRepositoriesSuccess() async throws {
        // Given: a mock service with successful response
        let mockService = MockRepositoriesService()
       // mock
        let viewModel = RepositoriesViewModel(repositoriesService: mockService)

        await viewModel.fetchRepositories()

        // delay for 5 seconeds to load json file
        try await Task.sleep(nanoseconds: 5_000_000_000)

        XCTAssertFalse(viewModel.repositories.isEmpty, "Repositories shouldn't be empty")
        XCTAssertFalse(viewModel.isLoading, "Loading should be false after fetching")
    }
    func testFetchRepositoriesNetworkError() async throws {
        // Given: a mock service that fails with a network error
        let mockService = MockRepositoriesService()
        mockService.shouldFail = true
        mockService.error = .networkError(URLError(.timedOut))

        let viewModel = RepositoriesViewModel(repositoriesService: mockService)

        // When: fetching repositories
        await viewModel.fetchRepositories()

        // delay for 5 seconeds to load json file
        try await Task.sleep(nanoseconds: 5_000_000_000)

        // Then: check if the error is handled correctly
        XCTAssertEqual(viewModel.error?.errorDescription,
                       APIError.networkError(URLError(.timedOut)).errorDescription,
                       "Error message should match the network error")
        XCTAssertFalse(viewModel.isLoading, "Loading should be false after fetching")
    }
}
