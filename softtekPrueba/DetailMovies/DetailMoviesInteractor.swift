//
//  DetailMoviesInteractor.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import Foundation
protocol DetailMoviesInteractorProtocol {
    func getDetail()-> MovieEntity
}

extension DetailMoviesInteractorProtocol {
    func getDetail()-> MovieEntity { MovieEntity(id: Int(), imageUrl: String(), nameOfMovie: String(), note: Float(), releaseDate: String(), resume: String()) }
}

class DetailMoviesInteractor: DetailMoviesInteractorProtocol {
}

class DetailMoviesInteractorMoock: DetailMoviesInteractorProtocol {
    func getDetail() -> MovieEntity {
        MovieEntity(id: 0,imageUrl: "", nameOfMovie: "Movie 01", note: 5.0, releaseDate: "2023", resume: "Resume")
    }
    
    
}
