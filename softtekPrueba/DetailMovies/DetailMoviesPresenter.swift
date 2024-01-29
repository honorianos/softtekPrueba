//
//  DetailMoviesPresenter.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import Foundation

import UIKit

protocol DetailMoviesPresenterProtocol {
    var view: DetailMoviesUI? { get }
    var viewData: MovieEntity? { get }
    func onViewAppear()
}

protocol DetailMoviesUI: AnyObject {
    func presentMovies(movie: MovieEntity)
}

class DetailMoviesPresenter: DetailMoviesPresenterProtocol {
    weak var view: DetailMoviesUI?
    var viewData: MovieEntity?
    private let utils = Utils()
    private let detailMovieInteractor: DetailMoviesInteractorProtocol?
    
    init(detailMovieInteractor: DetailMoviesInteractorProtocol?, viewData: MovieEntity?) {
        self.viewData = viewData
        self.detailMovieInteractor = detailMovieInteractor
    }

    func onViewAppear() {
        self.view?.presentMovies(movie: self.viewData ?? MovieEntity(id: Int(), imageUrl: String(), nameOfMovie: String(), note: Float(), releaseDate: String(), resume: String()))
    }
    
    func flowToListOfMovies() {
        
    }
}
