//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Yauheni Karas on 15/10/2025.
//

import Foundation

public final class RemoteFeedLoader: FeedLoader {
    private let url: URL
    private  let client: HTTPClient
    
    public enum Error: Swift.Error {
        case networkError
        case invalidData
    }
    
    public typealias Result = LoadFeedResult
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case let .succes(data, response):
                completion(FeedItemsMapper.map(data, response: response))
            case .failure:
                completion(.failure(Error.networkError))
            }
        }
    }
}



