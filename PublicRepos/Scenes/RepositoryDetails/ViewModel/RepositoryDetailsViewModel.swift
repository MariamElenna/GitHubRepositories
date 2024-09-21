//
//  RepositoryDetailsViewModel.swift
//  PublicRepos
//
//  Created by Mariam on 21/09/2024.
//

import Foundation

class RepositoryDetailsViewModel: ObservableObject {
    @Published var repository: RepositoryDetailsModel?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private let repositoryDetailsService: RepositoryDetailsApiProtocol
    init(repositoryDetailsService: RepositoryDetailsApiProtocol = RepositoryDetailsService()){
        self.repositoryDetailsService = repositoryDetailsService
    }
    
    @MainActor func fetchRepositoryDetails(fullName: String) {
        Task {
            isLoading = true
            // Do, catch and try are used to handle the errors the function may throw.
            do {
                self.repository = try await repositoryDetailsService.fetchRepositoryDetails(fullName: fullName)
                self.isLoading = false
            } catch let error as APIError {
                print("API Error: \(error.localizedDescription)")
                self.isLoading = false
                throw error
            } catch {
                self.errorMessage = "Failed to load repository details: \(error.localizedDescription)"
                self.isLoading = false
                throw APIError.unknownError
            }
        }
    }
    
    // Function to format the date
    func  formattedDate(from isoDateString: String?) -> String {
        // Create a DateFormatter to parse the ISO 8601 date string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        guard let isoDateString = isoDateString else {
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
            return dateFormatter.string(from: Date())
        }
        
        // Parse the ISO date string
        guard let date = dateFormatter.date(from: isoDateString) else {
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
            return dateFormatter.string(from: Date())
        }
        
        // Calculate the difference between the current date and the given date
        let calendar = Calendar.current
        let currentDate = Date()
        let sixMonthsAgo = calendar.date(byAdding: .month, value: -6, to: currentDate)!
        
        // If the date is within the last 6 months
        if date > sixMonthsAgo {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "EEEE, MMM d, yyyy" // e.g., Thursday, Oct 22, 2020
            outputFormatter.timeZone = TimeZone.current
            return outputFormatter.string(from: date)
        } else {
            // If the date is older than 6 months, return a relative date format like "8 months ago"
            let relativeFormatter = RelativeDateTimeFormatter()
            relativeFormatter.unitsStyle = .full
            return relativeFormatter.localizedString(for: date, relativeTo: currentDate) // e.g., "8 months ago"
        }
    }
}
