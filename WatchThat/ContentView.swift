//
//  ContentView.swift
//  WatchThat
//
//  Created by Igor Camilo on 09.04.24.
//

import SwiftUI

struct ContentView: View {
    @State private var movies = [Movie]()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 260))]) {
                    ForEach(movies) { movie in
                        let baseURL = URL(string: "https://image.tmdb.org/t/p/w780")
                        AsyncImage(url: baseURL?.appending(path: movie.posterPath)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            Text(movie.title)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .aspectRatio(2/3, contentMode: .fill)
                                .background(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Popular Movies")
        }
        .task {
            let client = Client(token: <#T##String#>)
            print("start")
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
