//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Yauheni Karas on 04/11/2025.
//

import Foundation

public enum HTTPClientResult {
    case succes(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}

