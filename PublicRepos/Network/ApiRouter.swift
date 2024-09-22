//
//  ApiRouter.swift
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
    func performRequest<T: Decodable>(_ type: T.Type, session: URLSession = .shared) async throws -> T {
        guard let request = urlRequest else {
            throw APIError.invalidURL
        }
        do {
            /* we can use the session to deal with data,upload,or download but here we just want to get data
             data is modern than dataTask and it handles threads automatically,
             don't need .resume, uses try/catch for error handling,
             It returns data and response directly in a single call,
             uses async/await to perform network requests
             supports Swift's concurrency model*/
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                if let httpResponse = response as? HTTPURLResponse {
                    throw APIError.responseError(statusCode: httpResponse.statusCode)
                } else {
                    throw APIError.unknownError
                }
            }
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                return decodedResponse
            } catch {
                throw APIError.decodingError
            }
        } catch {
            throw APIError.networkError(error)
        }
    }
}
