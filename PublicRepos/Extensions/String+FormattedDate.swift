//
//  String+FormattedDate.swift
//  PublicRepos
//
//  Created by Mariam on 22/09/2024.
//

import Foundation

extension String {

    var formattedDate: String {

        let locale = Locale(identifier: "en_US_POSIX")
        // Create a DateFormatter to parse date string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.locale = locale

        // Parse the ISO date string
        guard let date = dateFormatter.date(from: self) else {
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
            relativeFormatter.locale = Locale(identifier: "en_US_POSIX")
            relativeFormatter.unitsStyle = .full
            return relativeFormatter.localizedString(for: date, relativeTo: currentDate) // e.g., "8 months ago"
        }
    }
}
