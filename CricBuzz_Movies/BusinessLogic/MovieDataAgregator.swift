//
//  MovieDataAgregator.swift
//  CricBuzz_Movies
//
//  Created by Lakshmipathi MacM1 on 24/07/24.
//

import Foundation

class MovieDataAgregator {
    static func fetchAllMovieCategory(movieList: [MovieData]) -> [MovieMenuItem] {
        var menuItems = [MovieMenuItem]()

        let createCategoryList: (KeyPath<MovieData, String>, MovieCategoryType) -> [MovieMenuItem] = { keyPath, categoryType in
            let categorySet = movieList
                .flatMap { $0[keyPath: keyPath].split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) } }
                .reduce(into: Set<String>()) { $0.insert($1) }
                .sorted()
            
            return [MovieMenuItem(name: categoryType.rawValue,
                                  subItems: categorySet.map { MovieMenuItem(name: $0, subItems: nil, parentItemName: categoryType.rawValue) },
                                  parentItemName: nil)]
        }

        let yearList = Array(Set(movieList.map { $0.year.removeTrailingHyphen() })).sorted()
        menuItems.append(MovieMenuItem(name: MovieCategoryType.year.rawValue,
                                       subItems: yearList.map { MovieMenuItem(name: $0, subItems: nil, parentItemName: MovieCategoryType.year.rawValue) },
                                       parentItemName: nil))

        menuItems += createCategoryList(\.genre, .genre)
        menuItems += createCategoryList(\.director, .director)
        menuItems += createCategoryList(\.actors, .actor)

        menuItems.append(MovieMenuItem(name: MovieCategoryType.allMovies.rawValue, subItems: nil, parentItemName: nil))
        
        return menuItems
    }
    
    static func fetchMovieListByCategory(menuItem: MovieMenuItem, movieList: [MovieData]) -> [MovieData] {
        guard let mainMenuName = menuItem.parentItemName, menuItem.subItems == nil else {
            return menuItem.parentItemName == nil && menuItem.subItems == nil ? movieList : []
        }

        let searchKey = menuItem.name
        return movieList.filter { movie in
            switch mainMenuName {
            case MovieCategoryType.year.rawValue:
                return searchKey == movie.year.removeTrailingHyphen()
            case MovieCategoryType.genre.rawValue:
                return movie.genre.components(separatedBy: ",").contains { $0.trimmingCharacters(in: .whitespaces) == searchKey }
            case MovieCategoryType.director.rawValue:
                return movie.director.components(separatedBy: ",").contains { $0.trimmingCharacters(in: .whitespaces) == searchKey }
            case MovieCategoryType.actor.rawValue:
                return movie.actors.components(separatedBy: ",").contains { $0.trimmingCharacters(in: .whitespaces) == searchKey }
            default:
                return false
            }
        }
    }
}

extension String {
    func removeTrailingHyphen() -> String {
        let result = self.trimmingCharacters(in: CharacterSet(charactersIn: "–"))
        return result
    }
}
