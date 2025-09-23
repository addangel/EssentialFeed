//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Andrada Nistor on 23.09.2025.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}

