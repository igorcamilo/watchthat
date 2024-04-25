//
//  Client.swift
//  TMDB
//
//  Created by Igor Camilo on 09.04.24.
//

import Dependencies
import DependenciesMacros
import Foundation

@DependencyClient
public struct Client: DependencyKey, Sendable {
    public var movies: @Sendable (MovieList) async throws -> [Movie]

    public static var liveValue: Client {
        @Dependency(\.urlSession) var urlSession
        return Client(
            movies: {
                let container = try await request(
                    ResultsContainer<Movie>.self,
                    endpoint: $0.endpoint,
                    urlSession: urlSession
                )
                return container.results
            }
        )
    }
}

public extension DependencyValues {
    var tmdbClient: Client {
        get { self[Client.self] }
        set { self[Client.self] = newValue }
    }
}

public enum MovieList: Sendable {
    case nowPlaying
    case popular
    case topRated
    case upcoming
}

public enum ClientError: Error, Sendable {
    case invalidBaseURL
}

private func request<T>(
    _ type: T.Type,
    endpoint: String,
    urlSession: URLSession
) async throws -> T where T: Decodable {
    guard let url = URL(string: "https://api.themoviedb.org/3/\(endpoint)") else {
        throw ClientError.invalidBaseURL
    }
    var request = URLRequest(url: url)
    let token = <#T##String#>
    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    let (data, _) = try await urlSession.data(for: request)
    return try JSONDecoder().decode(T.self, from: data)
}

private extension MovieList {
    var endpoint: String {
        switch self {
        case .nowPlaying:
            "movie/now_playing"
        case .popular:
            "movie/popular"
        case .topRated:
            "movie/top_rated"
        case .upcoming:
            "movie/upcoming"
        }
    }
}
