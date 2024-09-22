//
//  RepositoryModelTest.swift
//  PublicReposTests
//
//  Created by Mariam on 22/09/2024.
//

import XCTest
@testable import PublicRepos

final class RepositoryModelTest: XCTestCase {

    private let repoObject = DataLoader().loadJsonData(file: .repoDetailsFile)!

    // Test formattedDate function with date less than 6 months ago
    func testFormattedDateWithin6Months() throws {
        let recentDate = "2024-05-01T14:37:16Z" // A recent date
        do {
            let repo = try JSONDecoder().decode(RepositoryModel.self, from: repoObject)
            let formattedDate = repo.formattedDate(from: recentDate)
            XCTAssertTrue(formattedDate.contains("2024"), "Formatted date should contain the year 2023 for recent dates")
        } catch {
            throw error
        }
    }
    
    // Test formattedDate function with date older than 6 months
    func testFormattedDateOlderThan6Months() throws {
        let oldDate = "2022-01-01T14:37:16Z" // More than 6 months ago
        do {
            let repo = try JSONDecoder().decode(RepositoryModel.self, from: repoObject)
            let formattedDate = repo.formattedDate(from: oldDate)
            XCTAssertTrue(formattedDate.contains("year") || formattedDate.contains("months") || formattedDate.contains("سن") || formattedDate.contains("شهر"), "Formatted date should return relative time (e.g., '1 year ago')")
        } catch {
            throw error
        }
    }
    
    // Test formattedDate with nil input
    func testFormattedDateNilInput() throws {
        do {
            let repo = try JSONDecoder().decode(RepositoryModel.self, from: repoObject)
            let formattedDate = repo.formattedDate(from: nil)
            XCTAssertNotNil(formattedDate, "Formatted date should still return a valid value for nil input")
        } catch {
            throw error
        }
    }
}
