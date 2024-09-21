//
//  RepositoryModel.swift
//  PublicRepos
//
//  Created by Mariam on 19/09/2024.
//

import Foundation

struct RepositoryModel : Codable, Identifiable {
    let archiveUrl : String?
    let assigneesUrl : String?
    let blobsUrl : String?
    let branchesUrl : String?
    let collaboratorsUrl : String?
    let commentsUrl : String?
    let commitsUrl : String?
    let compareUrl : String?
    let contentsUrl : String?
    let contributorsUrl : String?
    let deploymentsUrl : String?
    let descriptionField : String?
    let downloadsUrl : String?
    let eventsUrl : String?
    let fork : Bool?
    let forksUrl : String?
    let fullName : String?
    let gitCommitsUrl : String?
    let gitRefsUrl : String?
    let gitTagsUrl : String?
    let hooksUrl : String?
    let htmlUrl : String?
    let id : Int?
    let issueCommentUrl : String?
    let issueEventsUrl : String?
    let issuesUrl : String?
    let keysUrl : String?
    let labelsUrl : String?
    let languagesUrl : String?
    let mergesUrl : String?
    let milestonesUrl : String?
    let name : String?
    let nodeId : String?
    let notificationsUrl : String?
    let owner : RepositoryOwnerModel?
    let privateField : Bool?
    let pullsUrl : String?
    let releasesUrl : String?
    let stargazersUrl : String?
    let statusesUrl : String?
    let subscribersUrl : String?
    let subscriptionUrl : String?
    let tagsUrl : String?
    let teamsUrl : String?
    let treesUrl : String?
    let url : String?
    
    
    enum CodingKeys: String, CodingKey {
        case archiveUrl = "archive_url"
        case assigneesUrl = "assignees_url"
        case blobsUrl = "blobs_url"
        case branchesUrl = "branches_url"
        case collaboratorsUrl = "collaborators_url"
        case commentsUrl = "comments_url"
        case commitsUrl = "commits_url"
        case compareUrl = "compare_url"
        case contentsUrl = "contents_url"
        case contributorsUrl = "contributors_url"
        case deploymentsUrl = "deployments_url"
        case descriptionField = "description"
        case downloadsUrl = "downloads_url"
        case eventsUrl = "events_url"
        case fork = "fork"
        case forksUrl = "forks_url"
        case fullName = "full_name"
        case gitCommitsUrl = "git_commits_url"
        case gitRefsUrl = "git_refs_url"
        case gitTagsUrl = "git_tags_url"
        case hooksUrl = "hooks_url"
        case htmlUrl = "html_url"
        case id = "id"
        case issueCommentUrl = "issue_comment_url"
        case issueEventsUrl = "issue_events_url"
        case issuesUrl = "issues_url"
        case keysUrl = "keys_url"
        case labelsUrl = "labels_url"
        case languagesUrl = "languages_url"
        case mergesUrl = "merges_url"
        case milestonesUrl = "milestones_url"
        case name = "name"
        case nodeId = "node_id"
        case notificationsUrl = "notifications_url"
        case owner
        case privateField = "private"
        case pullsUrl = "pulls_url"
        case releasesUrl = "releases_url"
        case stargazersUrl = "stargazers_url"
        case statusesUrl = "statuses_url"
        case subscribersUrl = "subscribers_url"
        case subscriptionUrl = "subscription_url"
        case tagsUrl = "tags_url"
        case teamsUrl = "teams_url"
        case treesUrl = "trees_url"
        case url = "url"
    }
    
}
