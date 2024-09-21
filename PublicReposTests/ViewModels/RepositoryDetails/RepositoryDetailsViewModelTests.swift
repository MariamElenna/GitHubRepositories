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
        let repo: RepositoryDetailsModel = try await mockService.fetchRepositoryDetails(fullName: "mojombo/grit")
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

    // Test formattedDate function with date less than 6 months ago
    func testFormattedDateWithin6Months() {
        let recentDate = "2024-05-01T14:37:16Z" // A recent date
        
        let formattedDate = viewModel.formattedDate(from: recentDate)
        
        XCTAssertTrue(formattedDate.contains("2024"), "Formatted date should contain the year 2023 for recent dates")
    }
    
    // Test formattedDate function with date older than 6 months
    func testFormattedDateOlderThan6Months() {
        let oldDate = "2022-01-01T14:37:16Z" // More than 6 months ago
        
        let formattedDate = viewModel.formattedDate(from: oldDate)
        
        XCTAssertTrue(formattedDate.contains("year") || formattedDate.contains("months"), "Formatted date should return relative time (e.g., '1 year ago')")
    }
    
    // Test formattedDate with nil input
    func testFormattedDateNilInput() {
        let formattedDate = viewModel.formattedDate(from: nil)
        
        XCTAssertNotNil(formattedDate, "Formatted date should still return a valid value for nil input")
    }
}
