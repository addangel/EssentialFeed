//
//  RemoteFeedLoaderTests.swift
//  EssentialFeed
//
//  Created by Andrada Nistor on 14.04.2025.
//


import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "https://google.com")!
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    
    private init() {}
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
   
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
                
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
