//
//  RepositoryModel.swift
//  PublicRepos
//
//  Created by Mariam on 19/09/2024.
//

import Foundation

struct RepositoryModel : Decodable {
    let createdAt : String?
    let descriptionField : String?
    let forksCount : Int?
    let fullName : String?
    let id : Int?
    let name : String?
    let networkCount : Int?
    let nodeId : String?
    let openIssuesCount : Int?
    let owner : RepositoryOwnerModel?
    let privateField : Bool?
    let pullsUrl : String?
    let pushedAt : String?
    let releasesUrl : String?
    let size : Int?
    let sshUrl : String?
    let stargazersCount : Int?
    let subscribersCount : Int?
    let subscribersUrl : String?
    let subscriptionUrl : String?
    let svnUrl : String?
    let tagsUrl : String?
    let teamsUrl : String?
    let tempCloneToken : String?
    let topics : [String]?
    let treesUrl : String?
    let updatedAt : String?
    let url : String?
    let watchersCount : Int?
    var formattedCreationDate: String {
        return formattedDate(from: createdAt)
    }
    var formattedUpdateDate: String {
        return formattedDate(from: updatedAt)
    }

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case descriptionField = "description"
        case forksCount = "forks_count"
        case fullName = "full_name"
        case id = "id"
        case name = "name"
        case networkCount = "network_count"
        case nodeId = "node_id"
        case openIssuesCount = "open_issues_count"
        case owner
        case privateField = "private"
        case pullsUrl = "pulls_url"
        case pushedAt = "pushed_at"
        case releasesUrl = "releases_url"
        case size = "size"
        case sshUrl = "ssh_url"
        case stargazersCount = "stargazers_count"
        case subscribersCount = "subscribers_count"
        case subscribersUrl = "subscribers_url"
        case subscriptionUrl = "subscription_url"
        case svnUrl = "svn_url"
        case tagsUrl = "tags_url"
        case teamsUrl = "teams_url"
        case tempCloneToken = "temp_clone_token"
        case topics = "topics"
        case treesUrl = "trees_url"
        case updatedAt = "updated_at"
        case url = "url"
        case watchersCount = "watchers_count"
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
