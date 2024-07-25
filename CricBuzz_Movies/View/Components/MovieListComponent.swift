//
//  MovieListComponent.swift
//  CricBuzz_Movies
//
//  Created by Lakshmipathi MacM1 on 25/07/24.
//

import SwiftUI

struct MovieListComponent: View {
    var movieList: [MovieData]
    var body: some View {
        List(movieList) { movie in
            NavigationLink {
                MovieDetailsView(movie: movie)
            } label: {
                HStack {
                    AsyncImage(url: URL(string: movie.poster)) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                                    .frame(width: 80, height: 80)
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 80, height: 80)
                                                    .clipped()
                                            case .failure:
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 80, height: 80)
                                                    .clipped()
                                            @unknown default:
                                                EmptyView()
                                            }
                                        }
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(8)
                                        
                                        Spacer(minLength: 5)
                                        // Movie Details
                                        VStack(alignment: .leading, spacing: 0) {
                                            Text(movie.title)
                                                .font(.headline)
                                            Spacer(minLength: 5)
                                            Text("Language: \(movie.language)")
                                            Spacer(minLength: 2)
                                            Text("Year: \(movie.year)")
                                        }
                                    }
                                    .padding(.vertical, 5)
            }
        }
    }
}

#Preview {
    MovieListComponent(movieList: [MovieData]())
}
