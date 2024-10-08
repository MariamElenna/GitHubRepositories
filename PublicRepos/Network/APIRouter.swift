//
//  APIRouter.swift
//  PublicRepos
//
//  Created by Mariam on 19/09/2024.
//

import Foundation

enum APIRouter {
    // MARK: - Repositories Cases
    case getRepositories
    case getRepositoryDetails(fullName: String)

    private var path: String {
        switch self {
        case .getRepositories:
            return "repositories"
        case .getRepositoryDetails(let fullName):
            return "repos/\(fullName)"
        }
    }

    private var urlRequest: URLRequest? {
        guard let url = URL(string: Environments().baseUrl + path) else {
            return nil
        }
        let request = URLRequest(url: url)
        return request
    }

    // MARK: - Perform Request
    // we can inject session if we want to test response
    /*URLSession.shared: A shared singleton instance that’s suitable for most use cases,
     but we can create our own instances allows for more customization,
     such as configuring timeouts, allow or restrict certain types of network requests,
     and caching policies.*/
    func performRequest<T: Decodable>(_ type: T.Type, client: APIClient = APIClient()) async throws -> T {
        guard let request = urlRequest else {
            throw APIError.invalidURL
        }

        return try await client.loadData(from: request)
    }
}
