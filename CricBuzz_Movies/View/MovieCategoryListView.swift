//
//  MovieCategoryListView.swift
//  CricBuzz_Movies
//
//  Created by Lakshmipathi MacM1 on 24/07/24.
//

import SwiftUI

struct MovieCategoryListView: View {
    @State private var searchText: String = ""
    @ObservedObject var viewModel = MovieCategoryListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.top)
                List(viewModel.movieMenuItems, children: \.subItems) { item in
                    if item.subItems != nil {
                        HStack {
                            Text(item.name)
                                .font(.system(.title2, design: .rounded))
                                .bold()
                        }
                    } else {
                        NavigationLink(destination: MovieListView(viewModel: MovieListViewModel(selectedMenuItem: item))) {
                            HStack {
                                Text(item.name)
                                    .font(.system(item.parentItemName == nil ? .title2 : .title3, design: .rounded))
                                    .bold()
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .onAppear {
                    viewModel.loadMovieCategoryList()
                }
            }
        }
    }
}

#Preview {
    MovieCategoryListView(viewModel: MovieCategoryListViewModel())
}
