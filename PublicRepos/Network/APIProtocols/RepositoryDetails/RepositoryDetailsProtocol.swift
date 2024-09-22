//
//  RepositoryDetailsApiProtocol.swift
//  PublicRepos
//
//  Created by Mariam on 21/09/2024.
//

import Foundation

protocol RepositoryDetailsProtocol {
    func fetchRepositoryDetails(fullName: String) async throws -> RepositoryModel
}
