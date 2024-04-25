//
//  ResultsContainer.swift
//  TMDB
//
//  Created by Igor Camilo on 09.04.24.
//

public struct ResultsContainer<T> {
    public var page: Int
    public var results: [T]
    public var totalPages: Int
    public var totalResults: Int

    public init(page: Int, results: [T], totalPages: Int, totalResults: Int) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }

    private enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

extension ResultsContainer: Decodable where T: Decodable {}
extension ResultsContainer: Encodable where T: Encodable {}
extension ResultsContainer: Equatable where T: Equatable {}
extension ResultsContainer: Hashable where T: Hashable {}
extension ResultsContainer: Sendable where T: Sendable {}
