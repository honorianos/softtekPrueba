//
//  MoviesPresenter.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import Foundation
import UIKit

protocol MoviesPresenterProtocol {
    var view: MoviesViewUI? { get set }
    func onViewAppear()
    func getDataMovies()
    func flowDetail(item: MovieEntity)
}

protocol MoviesViewUI: AnyObject {
    func presentMovies(movies: [MovieEntity])
    func showLoader()
    func hideLoader()
    func errorServer()
    func errorParsing()
    func errorNetwork()
}

class MoviesPresenter: MoviesPresenterProtocol {
    weak var view: MoviesViewUI?
    private let utils = Utils()
    private let moviesInteractor: MoviesInteractorProtocol?
    private var router: MoviesRouterProtocol

    init(moviesInteractor: MoviesInteractorProtocol?, router: MoviesRouterProtocol) {
        self.moviesInteractor = moviesInteractor
        self.router = router
    }
    
    func onViewAppear() {
        getDataMovies()
    }
    
    func getDataMovies() {
        if isOnline {
            view?.showLoader()
            moviesInteractor?.getDataMovies { [self] (response) in
                view?.hideLoader()
                guard let responseData = response?.data else { return}
                let valido = self.parseMovies(responseData)
                if !valido{
                    self.view?.errorServer()
                }
                
            }
        }
        else {
            self.view?.errorNetwork()
        }
       
    }
    
    private func parseMovies(_ datos: Data)-> Bool {
        do{
            let decoder = JSONDecoder()
            let Data = try decoder.decode(MovieEntityResponse.self, from: datos)
            for item in Data.results {
                if let _ = item.imageUrl {
                    DatabaseServiceMovie.shared.saveMovie(movie: ModelMovie(id: item.id,
                                                                            imageUrl: item.imageUrl ?? String(),
                                                                            name: item.nameOfMovie,
                                                                            note: String(item.note),
                                                                            releaseDate: item.releaseDate,
                                                                            resume: item.resume
                                                                           ))
                }
            }
            self.view?.presentMovies(movies: Data.results)
            return true
        } catch {
            print(error)
            self.view?.errorParsing()
            return false
        }
    }
    
    func flowDetail(item: MovieEntity) {
        self.router.goToDetailMovies(viewData: item)
    }
}
