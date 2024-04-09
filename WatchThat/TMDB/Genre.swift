//
//  Genre.swift
//  WatchThat
//
//  Created by Igor Camilo on 09.04.24.
//  Copyright © 2024 Igor Camilo. All rights reserved.
//

public struct Genre: Codable, Identifiable, Sendable {
    public var id: ID
    public var name: String

    public init(id: ID, name: String) {
        self.id = id
        self.name = name
    }

    public struct ID: Codable, Hashable, RawRepresentable, Sendable {
        public var rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
