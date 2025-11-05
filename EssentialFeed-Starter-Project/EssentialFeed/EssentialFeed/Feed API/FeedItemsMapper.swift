//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Yauheni Karas on 04/11/2025.
//

import Foundation

final class FeedItemsMapper {
    private struct Root: Decodable {
        var items: [Item]
        
        var feed: [FeedItem] {
            items.map { $0.item }
        }
    }
    
    private struct Item: Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL
        
        var item: FeedItem {
            return FeedItem(
                id: id,
                description: description,
                location: location,
                imageURL: image
            )
        }
    }
    
    private static var OK_200: Int { 200 }
    
    static func map(_ data: Data, response: HTTPURLResponse) -> RemoteFeedLoader.Result {
        guard
            response.statusCode == OK_200,
            let root = try? JSONDecoder().decode(Root.self, from: data) else {
            return .failure(RemoteFeedLoader.Error.invalidData)
        }

        return .success(root.feed)
 
    }
}
