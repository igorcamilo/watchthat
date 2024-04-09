//
//  PosterView.swift
//  WatchThat
//
//  Created by Igor Camilo on 09.04.24.
//  Copyright © 2024 Igor Camilo. All rights reserved.
//

import SwiftUI

struct PosterView: View {
    let movie: Movie

    var body: some View {
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

#Preview {
    PosterView(movie: .sample)
}

private extension Movie {
    static let sample = Movie(
        adult: false,
        backdropPath: "",
        genres: [],
        id: .init(rawValue: 1),
        originalLanguage: "",
        originalTitle: "",
        overview: "",
        popularity: 0,
        posterPath: "",
        releaseDate: "",
        title: "",
        video: false,
        voteAverage: 0,
        voteCount: 0
    )
}
