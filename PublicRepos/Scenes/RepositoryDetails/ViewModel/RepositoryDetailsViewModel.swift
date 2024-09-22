//
//  RepositoryDetailsViewModel.swift
//  PublicRepos
//
//  Created by Mariam on 21/09/2024.
//

import Foundation

class RepositoryDetailsViewModel: ObservableObject {

    @Published var repository: RepositoryDetailsUIModel?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    private let repositoryDetailsService: RepositoryDetailsProtocol

    init(repositoryDetailsService: RepositoryDetailsProtocol = RepositoryDetailsService()) {
        self.repositoryDetailsService = repositoryDetailsService
    }

    @MainActor
    func fetchRepositoryDetails(fullName: String) async {
        isLoading = true
        // Do, catch and try are used to handle the errors the function may throw.
        do {
            self.repository = try await RepositoryDetailsUIModel(
                from: repositoryDetailsService.fetchRepositoryDetails(
                    fullName: fullName
                )
            )
            self.isLoading = false
        } catch let error as APIError {
            self.errorMessage = "Failed to load repository details: \(error.localizedDescription)"
            self.isLoading = false
        } catch {
            self.errorMessage = "Failed to load repository details: \(error.localizedDescription)"
            self.isLoading = false
        }
    }
}
