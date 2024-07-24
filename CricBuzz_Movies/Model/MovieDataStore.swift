//
//  MovieDataStore.swift
//  CricBuzz_Movies
//
//  Created by Lakshmipathi MacM1 on 24/07/24.
//

import Foundation

class MovieDataStore {
    static let shared = MovieDataStore()
    
    private init() {}
    
    private var movieDataList: [MovieData] = []
    
    private func updateList(_ list: [MovieData]) {
        movieDataList.removeAll()
        movieDataList.append(contentsOf: list)
    }

    func getList() -> [MovieData] {
        guard movieDataList.isEmpty else {
            return movieDataList
        }
        if let parsedList = MoviesJSONParser.parseMoviesJSON(from: "movies") {
            updateList(parsedList)
        } else {
            debugPrint("Failed parsing the JSON data!")
        }
        return movieDataList
    }
}
