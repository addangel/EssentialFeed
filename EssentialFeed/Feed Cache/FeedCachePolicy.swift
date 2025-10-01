//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by Andrada Nistor on 01.10.2025.
//

import Foundation

final class FeedCachePolicy {
    private init() {}
    
    private static let calendar = Calendar(identifier: .gregorian)
    
    private static var maxcacheAgeInDays: Int {
        return 7
    }
    
    static func validate(_ timestamp: Date, against date: Date) -> Bool {
        guard let maxCacheAge = calendar.date(byAdding: .day, value: maxcacheAgeInDays, to: timestamp) else {
            return false
        }
        return date < maxCacheAge
    }
}
