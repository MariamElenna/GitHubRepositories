//
//  ImageCashe.swift
//  PublicRepos
//
//  Created by Mariam on 21/09/2024.
//

import SwiftUI

class ImageCache {
    static let shared = ImageCache()
    
    // NSCache to store the images in memory
    private let cache = NSCache<NSString, UIImage>()
    
    // Limit cache size, by setting a cost limit (in bytes, for example 50 MB)
    init() {
        cache.totalCostLimit = 50 * 1024 * 1024 // 50 MB
    }

    // Store the image in the cache
    func setImage(_ image: UIImage, forKey key: String) {
        let cost = image.jpegData(compressionQuality: 1)?.count ?? 0
        cache.setObject(image, forKey: key as NSString, cost: cost)
    }
    
    // Get the cached image
    func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    // Clear cache manually (useful for cache invalidation/expiry)
    func clearCache() {
        cache.removeAllObjects()
    }
}
