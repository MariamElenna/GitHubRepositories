//
//  RepositoriesViewModel.swift
//  PublicRepos
//
//  Created by Mariam on 20/09/2024.
//

import Foundation

class RepositoriesViewModel: ObservableObject {
    @Published var repositories: [RepositoryUIModel] = []
    @Published var error: APIError?
    @Published var isLoading: Bool = false

    private let repositoriesService: RepositoriesProtocol

    init(repositoriesService: RepositoriesProtocol = RepositoriesService()) {
        self.repositoriesService = repositoriesService
    }
    // Fetch Repositories
    @MainActor
    func fetchRepositories() async {
        isLoading = true
        // Do, catch and try are used to handle the errors the function may throw.
        do {
            self.repositories = try await repositoriesService.fetchRepositories().map { repo -> RepositoryUIModel in
                return RepositoryUIModel(from: repo)
            }
            self.isLoading = false
        } catch let error as APIError {
            self.error = error
            self.isLoading = false
        } catch {
            self.isLoading = false
        }
    }
}
