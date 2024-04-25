//
//  Movie.swift
//  TMDB
//
//  Created by Igor Camilo on 09.04.24.
//

import Tagged

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
    
    public init(
        adult: Bool,
        backdropPath: String,
        genres: [Genre.ID],
        id: ID,
        originalLanguage: String,
        originalTitle: String,
        overview: String,
        popularity: Double,
        posterPath: String,
        releaseDate: String,
        title: String,
        video: Bool,
        voteAverage: Double,
        voteCount: Int
    ) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.genres = genres
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
    
    public typealias ID = Tagged<Movie, Int>

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
