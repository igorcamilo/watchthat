//
//  Genre.swift
//  TMDB
//
//  Created by Igor Camilo on 09.04.24.
//

import Tagged

public struct Genre: Codable, Identifiable, Sendable {
    public var id: ID
    public var name: String

    public init(id: ID, name: String) {
        self.id = id
        self.name = name
    }
    
    public typealias ID = Tagged<Genre, Int>
}
