//
//  MovieListView.swift
//  CricBuzz_Movies
//
//  Created by Lakshmipathi MacM1 on 24/07/24.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel
    var body: some View {
        VStack {
            MovieListComponent(movieList: viewModel.movieList)
        }
        .navigationBarTitle("Movies", displayMode: .large)
        .onAppear(perform: {
            viewModel.loadMovieList()
        })
    }
}

#Preview {
    MovieListView(viewModel: MovieListViewModel(selectedMenuItem: MovieMenuItem(name: "All Movies", subItems: [], parentItemName: "")))
} 
