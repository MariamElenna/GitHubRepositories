//
//  RepositoriesViewModel.swift
//  PublicRepos
//
//  Created by Mariam on 20/09/2024.
//

import Foundation

class RepositoriesViewModel: ObservableObject {
    @Published var repositories: [RepositoryRowUIModel] = []
    @Published var error: APIError?
    @Published var isLoading: Bool = false
    
    private let repositoriesService: RepositoriesApiProtocol
    
    init(repositoriesService: RepositoriesApiProtocol = RepositoriesService()) {
        self.repositoriesService = repositoriesService
    }
    // Fetch Repositories
    @MainActor func fetchRepositories() {
        Task {
            isLoading = true
            // Do, catch and try are used to handle the errors the function may throw.
            do {
                self.repositories = try await repositoriesService.fetchRepositories().map { repo -> RepositoryRowUIModel in
                    return RepositoryRowUIModel(from: repo)
                }
                self.isLoading = false
            } catch let error as APIError {
                self.error = error
                self.isLoading = false
                throw error
            } catch {
                self.isLoading = false
                throw APIError.unknownError
            }
        }
    }
}
