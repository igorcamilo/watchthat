//
//  MovieDetailsView.swift
//  WatchThat
//
//  Created by Igor Camilo on 09.04.24.
//  Copyright © 2024 Igor Camilo. All rights reserved.
//

import SwiftUI
import TMDB

struct MovieDetailsView: View {
    let id: Movie.ID

    var body: some View {
        Text("Movie ID \(id)")
            .navigationTitle("Movie Details")
    }
}

#Preview {
    MovieDetailsView(id: .init(rawValue: 1))
}
