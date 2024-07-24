//
//  MoviesJSONParser.swift
//  CricBuzz_Movies
//
//  Created by Lakshmipathi MacM1 on 24/07/24.
//

import Foundation

class MoviesJSONParser {
    static func parseMoviesJSON(from filename: String) -> [MovieData]? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("Failed to locate \(filename) in bundle.")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let movies = try decoder.decode([MovieData].self, from: data)
            return movies
        } catch {
            print("Failed to decode \(filename) from bundle: \(error)")
            return nil
        }
    }
}

// Example usage
//if let movies = MoviesJSONParser.parseMovies(from: "movies") {
//    for movie in movies {
//        print("Title: \(movie.title), Year: \(movie.year)")
//    }
//} else {
//    print("Failed to parse movies.")
//}
