//
//  ContentView.swift
//  WatchThat
//
//  Created by Igor Camilo on 09.04.24.
//

import SwiftUI
import TMDB

struct ContentView: View {

    var body: some View {
        NavigationStack {
            PosterGridView()
            .navigationDestination(for: Movie.ID.self) { id in
                MovieDetailsView(id: id)
            }
        }
    }
}

#Preview {
    ContentView()
}
