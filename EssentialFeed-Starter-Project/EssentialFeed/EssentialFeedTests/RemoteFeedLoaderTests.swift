//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Yauheni Karas on 09/10/2025.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()
 
    func get(from url: URL) {
 
    }
}

class HTTPClintSpy: HTTPClient {
    var requestedURL: URL?
    
    override func get(from url: URL) {
        requestedURL = url
    }
}

final class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClintSpy()
        HTTPClient.shared = client
        let _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
 
    func test_load_requestDataFromURL()  {
        let client = HTTPClintSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
