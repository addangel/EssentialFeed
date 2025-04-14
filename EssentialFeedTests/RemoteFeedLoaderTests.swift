//
//  RemoteFeedLoaderTests.swift
//  EssentialFeed
//
//  Created by Andrada Nistor on 14.04.2025.
//


import XCTest

class RemoteFeedLoader {
    let client:HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func load() {
        client.get(from: URL(string: "https://google.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?

    func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
   
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
                
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client:client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
