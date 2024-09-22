//
//  RepositoryDetailsUIModelTest.swift
//  PublicReposTests
//
//  Created by Mariam on 22/09/2024.
//

import XCTest
@testable import PublicRepos

final class RepositoryDateFormattingTest: XCTestCase {
    // Test formattedDate function with date less than 6 months ago
    func testFormattedDateWithin6Months() {
        let mockRepository = RepositoryModel(createdAt: "2024-05-01T14:37:16Z",
                                             descriptionField: nil,
                                             fullName: nil, id: 0,
                                             name: nil,
                                             owner: RepositoryOwnerModel(avatarUrl: nil, id: nil, userName: nil),
                                             updatedAt: nil)

        let uiRepo = RepositoryUIModel(from: mockRepository)
        XCTAssertTrue(uiRepo.formatedCreationDate.contains("2024"),
                      "Formatted date should contain the year 2024 for recent dates")
    }

    // Test formattedDate function with date older than 6 months
    func testFormattedDateOlderThan6Months() {
        let mockRepository = RepositoryModel(createdAt: "2022-01-01T14:37:16Z",
                                             descriptionField: nil,
                                             fullName: nil, id: 0,
                                             name: nil,
                                             owner: RepositoryOwnerModel(avatarUrl: nil, id: nil, userName: nil),
                                             updatedAt: nil)

        let uiRepo = RepositoryUIModel(from: mockRepository)
        XCTAssertTrue(uiRepo.formatedCreationDate.contains("year")
                      || uiRepo.formatedCreationDate.contains("months"),
                      "Formatted date should return relative time (e.g., '1 year ago')")
    }

    // Test formattedDate with nil input
    func testFormattedDateNilInput() {
        let mockRepository = RepositoryModel(createdAt: nil,
                                             descriptionField: nil,
                                             fullName: nil, id: 0,
                                             name: nil,
                                             owner: RepositoryOwnerModel(avatarUrl: nil, id: nil, userName: nil),
                                             updatedAt: nil)
        let uiRepo = RepositoryUIModel(from: mockRepository)
        XCTAssertNotNil(uiRepo.formatedCreationDate, "Formatted date should still return a valid value for nil input")
    }
}
