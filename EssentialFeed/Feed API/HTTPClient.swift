//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Andrada Nistor on 04.05.2025.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
