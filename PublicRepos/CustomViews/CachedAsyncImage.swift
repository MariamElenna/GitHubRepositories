//
//  CachedAsyncImage.swift
//  PublicRepos
//
//  Created by Mariam on 21/09/2024.
//

import SwiftUI

struct CachedAsyncImage<Placeholder: View>: View {
    private let url: URL?
    private let placeholder: Placeholder
    private let imageCache = ImageCache.shared

    @State private var image: UIImage?

    init(url: URL?, @ViewBuilder placeholder: () -> Placeholder) {
        self.url = url
        self.placeholder = placeholder()
    }

    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                placeholder
                    .onAppear {
                        loadImage()
                    }
            }
        }
    }

    private func loadImage() {
        guard let url = url else { return }

        // Check if the image is already cached
        if let cachedImage = imageCache.getImage(forKey: url.absoluteString) {
            image = cachedImage
            return
        }

        // Download the image if not cached
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let downloadedImage = UIImage(data: data) {
                    imageCache.setImage(downloadedImage, forKey: url.absoluteString)
                    DispatchQueue.main.async {
                        image = downloadedImage
                    }
                }
            } catch {
                // Handle the error if image fails to load
                let logger = ProxyLogger(subsystem: "com.yourapp", category: "ImageLoading")
                logger.log("Failed to load image from URL: \(error.localizedDescription)", level: .error)
            }
        }
    }
}
