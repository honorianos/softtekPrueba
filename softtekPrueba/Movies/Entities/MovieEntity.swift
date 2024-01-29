//
//  MovieEntity.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import Foundation

struct MovieEntityResponse: Decodable {
    let results: [MovieEntity]
}

struct MovieEntity : Decodable {
    var id: Int
    var imageUrl: String?
    var nameOfMovie: String
    var note: Float
    var releaseDate: String
    var resume: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "poster_path"
        case nameOfMovie = "title"
        case note = "vote_average"
        case releaseDate = "release_date"
        case resume = "overview"
    }
}
