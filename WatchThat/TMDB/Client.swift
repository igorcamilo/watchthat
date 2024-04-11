//
//  Client.swift
//  WatchThat
//
//  Created by Igor Camilo on 09.04.24.
//  Copyright © 2024 Igor Camilo. All rights reserved.
//

import SwiftUI

public final class Client: Sendable {
    public let token: String

    public init(token: String) {
        self.token = token
    }

    public func popularMovies() async throws -> [Movie] {
        try await request(ResultsContainer<Movie>.self, endpoint: "movie/popular").results
    }

    private func request<T>(_ type: T.Type, endpoint: String) async throws -> T where T: Decodable {
        guard let url = URL(string: "https://api.themoviedb.org/3/\(endpoint)") else {
            throw ClientError.invalidBaseURL
        }
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(T.self, from: data)
    }
}

public enum ClientError: Error, Sendable {
    case invalidBaseURL
}

public extension EnvironmentValues {
    var client: Client {
        get { self[ClientEnvironmentKey.self] }
        set { self[ClientEnvironmentKey.self] = newValue }
    }
}

private enum ClientEnvironmentKey: EnvironmentKey {
    static let defaultValue = Client(token: <#T##String#>)
}
