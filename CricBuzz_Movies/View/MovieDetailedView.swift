//
//  MovieDetailedView.swift
//  CricBuzz_Movies
//
//  Created by Lakshmipathi MacM1 on 24/07/24.
//

import SwiftUI

import SwiftUI

struct MovieDetailsView: View {
    let movie: MovieData
    @State private var selectedRatingSource: RatingSource = .imdb

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Poster
                AsyncImage(url: URL(string: movie.poster)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: 300)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: 300)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: 300)
                    @unknown default:
                        EmptyView()
                    }
                }
                .padding(.bottom, 10)
                
                // Title
                Text(movie.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                // Plot
                Text("Plot")
                    .font(.headline)
                    .padding(.bottom, 2)
                
                Text(movie.plot)
                    .font(.body)
                    .padding(.bottom, 10)
                
                // Cast & Crew
                VStack(alignment: .leading) {
                    Text("Cast & Crew")
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    Text("Director: \(movie.director)")
                        .font(.body)
                    Text("Writer: \(movie.writer)")
                        .font(.body)
                    Text("Actors: \(movie.actors)")
                        .font(.body)
                }
                .padding(.bottom, 10)
                
                // Release Date
                Text("Released: \(movie.released)")
                    .font(.body)
                    .padding(.bottom, 10)
                
                // Genre
                Text("Genre: \(movie.genre)")
                    .font(.body)
                    .padding(.bottom, 10)
                
                // Rating Selector
                RatingSelector(selectedRatingSource: $selectedRatingSource)
                    .padding(.bottom, 20)
                
                // Rating Value
                if let rating = movie.ratings.first(where: { $0.source == selectedRatingSource.rawValue }) {
                    RatingView(source: selectedRatingSource, value: rating.value)
                } else {
                    Text("Rating not available")
                        .font(.body)
                }
            }
            .padding()
        }
        .navigationBarTitle("Movie Details", displayMode: .inline)
    }
}


#Preview {
    MovieDetailsView(movie: MovieData(title: "Indra", year: "2022", rated: "5", released: "2022", runtime: "3", genre: "Action", director: "B Gopal", writer: "B Gopal", actors: "Chiranjeevi", plot: "Somthing", language: "Telugu", country: "India", awards: "Nandi", poster: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo-DO6hhGvHymyBtsvoJYApTAYh5lVv2Y58dXgqlDJDULYYTNp0mOFGF6zU8P7JYsLnSc&usqp=CAU", ratings: [Rating(source: "Rotten Tomatoes", value: "84%")], metascore: nil, imdbRating: "9.0", imdbVotes: "100k", imdbID: "deeww312", type: "movie", dvd: "NA", boxOffice: "NA", production: "AA", website: "NA", response: "Awesome!"))
}
