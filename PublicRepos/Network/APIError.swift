//
//  APIError.swift
//  PublicRepos
//
//  Created by Mariam on 21/09/2024.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case responseError(statusCode: Int)
    case decodingError
    case networkError(Error)
    case unknownError

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL provided is invalid."
        case .responseError(let statusCode):
            return "Received an invalid response with status code: \(statusCode)"
        case .decodingError:
            return "Failed to decode the response."
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .unknownError:
            return "An unknown error occurred."
        }
    }
}
