//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Andrada Nistor on 05.08.2025.
//

import Foundation

public protocol FeedStore {
    typealias InsertionCompletion = (Error?) -> Void
    typealias DeletionCompletion = (Error?) -> Void

    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ items: [LocalFeedItem], timestamp: Date, completion: @escaping InsertionCompletion)
}

