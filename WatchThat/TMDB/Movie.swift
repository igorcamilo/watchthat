//
//  Movie.swift
//  WatchThat
//
//  Created by Igor Camilo on 09.04.24.
//  Copyright © 2024 Igor Camilo. All rights reserved.
//

public struct Movie: Codable, Identifiable, Sendable {
    public var adult: Bool
    public var backdropPath: String
    public var genres: [Genre.ID]
    public var id: ID
    public var originalLanguage: String
    public var originalTitle: String
    public var overview: String
    public var popularity: Double
    public var posterPath: String
    public var releaseDate: String
    public var title: String
    public var video: Bool
    public var voteAverage: Double
    public var voteCount: Int

    public struct ID: Codable, Hashable, RawRepresentable, Sendable {
        public var rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }

    private enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genres = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
