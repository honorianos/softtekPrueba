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
    var title: String
    var overview: String
    var imageUrl: String?
    var vote_count: Int
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case imageUrl = "poster_path"
        case vote_count
    }
}
