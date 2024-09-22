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

    // Test missing required keys
    func testDecoding_whenMissingRequiredKeys_itThrows() throws {
        try ["id", "owner"].forEach { key in
            assertThrowsKeyNotFound(key,
                                    decoding: RepositoryModel.self,
                                    from: try repoObject.json(deletingKeyPaths: key))
        }
    }
    // Helper to assert that decoding fails with a keyNotFound error
    func assertThrowsKeyNotFound<T: Decodable>(_ expectedKey: String,
                                               decoding: T.Type,
                                               from data: Data,
                                               file: StaticString = #file,
                                               line: UInt = #line) {
        XCTAssertThrowsError(
            try JSONDecoder()
                .decode(decoding, from: data),
            file: file,
            line: line) { error in
                if case let DecodingError.keyNotFound(key, _) = error {
                    XCTAssertEqual(expectedKey,
                                   key.stringValue,
                                   "Expected missing key '\(key.stringValue)' to equal '\(expectedKey)'.",
                                   file: file,
                                   line: line)
                } else {
                    XCTFail("Expected '.keyNotFound(\(expectedKey))' but got \(error)", file: file, line: line)
                }
            }
    }
}

extension Data {
    func json(deletingKeyPaths keyPaths: String...) throws -> Data {
        let decoded = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as AnyObject
        for keyPath in keyPaths {
            decoded.setValue(nil, forKeyPath: keyPath)
        }
        return try JSONSerialization.data(withJSONObject: decoded)
    }
}
