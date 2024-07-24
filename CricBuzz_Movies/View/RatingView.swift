//
//  RatingView.swift
//  CricBuzz_Movies
//
//  Created by Lakshmipathi MacM1 on 24/07/24.
//

import Foundation
import SwiftUI

enum RatingSource: String, CaseIterable, Identifiable {
    case imdb = "Internet Movie Database"
    case rottenTomatoes = "Rotten Tomatoes"
    case metacritic = "Metacritic"

    var id: String { self.rawValue }
}

struct RatingSelector: View {
    @Binding var selectedRatingSource: RatingSource

    var body: some View {
        VStack(alignment: .leading) {
            Text("Select Rating Source")
                .font(.headline)
            
            Picker("Rating Source", selection: $selectedRatingSource) {
                ForEach(RatingSource.allCases) { source in
                    Text(source.rawValue).tag(source)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct RatingView: View {
    let source: RatingSource
    let value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(source.rawValue) Rating")
                .font(.headline)
            
            Text(value)
                .font(.title)
                .fontWeight(.bold)
        }
    }
}
