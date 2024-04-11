//
//  PosterGridView.swift
//  WatchThat
//
//  Created by Igor Camilo on 11.04.24.
//  Copyright © 2024 Igor Camilo. All rights reserved.
//

import SwiftUI

struct PosterGridView: View {
    @State private var movies = [Movie]()
    @State private var list = List.nowPlaying
    @Environment(\.client) private var client

    var body: some View {
        let loadMovies: @MainActor () async -> Void = {
            do {
                switch list {
                case .nowPlaying:
                    movies = try await client.nowPlayingMovies()
                case .popular:
                    movies = try await client.popularMovies()
                case .topRated:
                    movies = try await client.topRatedMovies()
                case .upcoming:
                    movies = try await client.upcomingMovies()
                }
            } catch {
                print("error", error)
            }
        }
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 260))]) {
                ForEach(movies) { movie in
                    NavigationLink(value: movie.id) {
                        PosterView(movie: movie)
                    }
                    .buttonStyle(.borderless)
                }
            }
        }
        .navigationTitle("Watch That")
        .toolbar {
            ToolbarItem {
                Picker(selection: $list) {
                    ForEach(List.allCases, id: \.self) { list in
                        Text(list.name).tag(list)
                    }
                } label: {
                    Label("Change List", systemImage: "line.3.horizontal.circle")
                }
            }
        }
        .task { await loadMovies() }
        .refreshable { await loadMovies() }
        .onChange(of: list) { Task { await loadMovies() } }
    }

    private enum List: CaseIterable {
        case nowPlaying
        case popular
        case topRated
        case upcoming

        var name: LocalizedStringKey {
            switch self {
            case .nowPlaying:
                "Now Playing"
            case .popular:
                "Popular"
            case .topRated:
                "Top Rated"
            case .upcoming:
                "Upcoming"
            }
        }
    }
}

#Preview {
    PosterGridView()
}
