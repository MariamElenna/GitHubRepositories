//
//  APIClient.swift
//  PublicRepos
//
//  Created by Mariam on 22/09/2024.
//

import Foundation
import UIKit

// MARK: - URLSession
protocol URLSessionProtocol {
    func data(with request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {
    func data(with request: URLRequest) async throws -> (Data, URLResponse) {
        try await data(for: request)
    }
}

final class APIClient {

    private let session: URLSessionProtocol
    private let decoder: JSONDecoder

    init(withSession session: URLSessionProtocol? = nil, decoder: JSONDecoder = JSONDecoder()) {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        self.session = session ?? URLSession(configuration: config)
        self.decoder = decoder
    }

    func loadData<T: Decodable>(from request: URLRequest) async throws -> T {
        let (data, response) = try await session.data(with: request)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw APIError.unknownError
        }
        return try decoder.decode(T.self, from: data)
    }
}
