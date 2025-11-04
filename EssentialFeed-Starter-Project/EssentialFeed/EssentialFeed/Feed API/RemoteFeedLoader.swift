//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Yauheni Karas on 15/10/2025.
//

import Foundation

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case networkError
        case invalidData
    }
    
    public enum Result: Equatable {
        case success([FeedItem])
        case failure(Error)
    }
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { result in
            switch result {
            case let .succes(data, response):
                completion(FeedItemsMapper.map(data, response: response))
            case .failure:
                completion(.failure(.networkError))
            }
        }
    }

}



