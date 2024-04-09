//
//  ParsedData.swift
//  WatchThat
//
//  Created by Igor Camilo on 09.04.24.
//  Copyright © 2024 Igor Camilo. All rights reserved.
//

public struct ParsedData<T> {
    public var results: [T]

    init(results: [T]) {
        self.results = results
    }
}

extension ParsedData: Decodable where T: Decodable {}
extension ParsedData: Encodable where T: Encodable {}
extension ParsedData: Equatable where T: Equatable {}
extension ParsedData: Hashable where T: Hashable {}
extension ParsedData: Sendable where T: Sendable {}
