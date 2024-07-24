//
//  MovieCategoryData.swift
//  CricBuzz_Movies
//
//  Created by Lakshmipathi MacM1 on 24/07/24.
//

import Foundation

struct MovieMenuItem: Identifiable {
    let id = UUID()
    let name: String
    let subItems: [MovieMenuItem]?
    let parentItemName: String?
}
