//
//  ContentView.swift
//  WatchThat
//
//  Created by Igor Camilo on 09.04.24.
//

import SwiftUI

struct ContentView: View {
    @State private var movies = [Movie]()
    @Environment(\.client) private var client

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 260))]) {
                    ForEach(movies) { movie in
                        NavigationLink(value: movie.id) {
                            PosterView(movie: movie)
                        }
                    }
                }
            }
            .navigationTitle("Popular Movies")
            .navigationDestination(for: Movie.ID.self) { id in
                MovieDetails(id: id)
            }
        }
        .task {
            do {
                movies = try await client.popularMovies()
            } catch {
                print("error", error)
            }
        }
    }
}

#Preview {
    ContentView()
}
