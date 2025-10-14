//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Andrada Nistor on 05.08.2025.
//

import Foundation

public enum RetrieveCachedFeedResult {
    case empty
    case found(feed: [LocalFeedImage], timestamp: Date)
    case failure(_ error: Error)
}

public protocol FeedStore {
    typealias InsertionCompletion = (Error?) -> Void
    typealias DeletionCompletion = (Error?) -> Void
    typealias RetrievalCompletion = (RetrieveCachedFeedResult) -> Void

    /// The completion handler can be invoked in any thread.
    /// Clients are responsible for dispatching to appropriate threads, if needed.
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    
    /// The completion handler can be invoked in any thread.
    /// Clients are responsible for dispatching to appropriate threads, if needed.
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion)
    
    /// The completion handler can be invoked in any thread.
    /// Clients are responsible for dispatching to appropriate threads, if needed.
    func retrieve(completion: @escaping RetrievalCompletion)
}

