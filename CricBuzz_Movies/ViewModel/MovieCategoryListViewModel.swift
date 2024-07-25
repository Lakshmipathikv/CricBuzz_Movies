//
//  MovieCategoryListViewModel.swift
//  CricBuzz_Movies
//
//  Created by Lakshmipathi MacM1 on 24/07/24.
//

import Foundation

class MovieCategoryListViewModel: ObservableObject {
    
    @Published var movieMenuItems: [MovieMenuItem] = []
    private var allMovies: [MovieData] = []
    func loadMovieCategoryList() {
        if let movies = MoviesJSONParser.parseMoviesJSON(from: "movies") {
            allMovies = movies
            movieMenuItems = MovieDataAgregator.fetchAllMovieCategory(movieList: allMovies)
        }
    }
    
    func filteredSearchBarItems(searchText: String) -> [MovieData] {
        return allMovies.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }
}
