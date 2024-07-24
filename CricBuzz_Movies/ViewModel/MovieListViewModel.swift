//
//  MovieListViewModel.swift
//  CricBuzz_Movies
//
//  Created by Lakshmipathi MacM1 on 24/07/24.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movieList: [MovieData] = []
    
    private let selectedMenuItem: MovieMenuItem
    
    init(selectedMenuItem: MovieMenuItem) {
        self.selectedMenuItem = selectedMenuItem
    }
    
    func loadMovieList() {
        let allMovies = MovieDataStore.shared.getList()
        movieList = MovieDataAgregator.fetchMovieListByCategory(menuItem: selectedMenuItem, movieList: allMovies)
    }
}

