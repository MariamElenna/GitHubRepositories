//
//  RepositoryDetailsService.swift
//  PublicRepos
//
//  Created by Mariam on 21/09/2024.
//

import Foundation


final class RepositoryDetailsService: RepositoryDetailsApiProtocol {
    func fetchRepositoryDetails(fullName: String) async throws -> RepositoryDetailsModel {
        return try await APIRouter.getRepositoryDetails(fullName: fullName).performRequest(RepositoryDetailsModel.self)
    }
}
