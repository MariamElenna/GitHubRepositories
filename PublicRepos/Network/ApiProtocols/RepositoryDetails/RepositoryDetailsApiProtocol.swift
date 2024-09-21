//
//  RepositoryDetailsApiProtocol.swift
//  PublicRepos
//
//  Created by Mariam on 21/09/2024.
//

import Foundation

protocol RepositoryDetailsApiProtocol {
    func fetchRepositoryDetails(fullName: String) async throws -> RepositoryDetailsModel
}
