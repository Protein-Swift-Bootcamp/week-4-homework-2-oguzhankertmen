//
//  Movie.swift
//  Assignment2
//
//  Created by Oğuzhan KERTMEN on 8.01.2023.
//

import Foundation

struct MovieResult: Decodable {
  let results: [Movie]?
}

struct Movie: Decodable {
  let id: Int?
  let posterPath: String?
  let overview, releaseDate, title: String?
  
  enum CodingKeys: String, CodingKey {
    case id
    case posterPath = "poster_path"
    case overview, title
    case releaseDate = "release_date"
  }
  
  var _id: Int {
    id ?? Int.min
  }
  var _posterPath: String {
    posterPath ?? ""
  }
}
