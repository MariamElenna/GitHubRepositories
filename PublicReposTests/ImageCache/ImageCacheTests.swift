//
//  ImageCacheTests.swift
//  PublicReposTests
//
//  Created by Mariam on 22/09/2024.
//

import XCTest
@testable import PublicRepos
import UIKit

class ImageCacheTests: XCTestCase {

    var imageCache: ImageCache!

    override func setUp() {
        super.setUp()
        imageCache = ImageCache.shared
        imageCache.clearCache() // Make sure the cache is empty before each test
    }

    override func tearDown() {
        imageCache.clearCache() // Clear cache after each test
        imageCache = nil
        super.tearDown()
    }

    func testSetImageAndRetrieveImage() {
        // Given
        let path = Bundle(for: type(of: self)).path(forResource: "testImage", ofType: "png")!
        let image = UIImage(contentsOfFile: path)! // Make sure to have a test image in your bundle
        let key = "testKey"

        // When
        imageCache.setImage(image, forKey: key)
        let cachedImage = imageCache.getImage(forKey: key)

        // Then
        XCTAssertNotNil(cachedImage, "Image should be retrieved from the cache")
        XCTAssertEqual(cachedImage, image, "Retrieved image should be the same as the stored image")
    }

    func testRetrieveNonExistentImage() {
        // Given
        let key = "nonExistentKey"

        // When
        let cachedImage = imageCache.getImage(forKey: key)

        // Then
        XCTAssertNil(cachedImage, "Retrieving a non-existent image should return nil")
    }

    func testClearCache() {
        // Given
        let path = Bundle(for: type(of: self)).path(forResource: "testImage", ofType: "png")!
        let image = UIImage(contentsOfFile: path)! // Make sure to have a test image in your bundle
        let key = "testKey"

        // When
        imageCache.setImage(image, forKey: key)
        imageCache.clearCache()
        let cachedImage = imageCache.getImage(forKey: key)

        // Then
        XCTAssertNil(cachedImage, "Image cache should be empty after calling clearCache()")
    }
}
