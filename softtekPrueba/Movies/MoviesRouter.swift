//
//  MoviesRouter.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import Foundation
import UIKit

protocol MoviesRouterProtocol: AnyObject {
    func showMoviesModule(vc: UINavigationController)
    func goToDetailMovies(viewData: MovieEntity)
}

class MoviesRouter: MoviesRouterProtocol {
    var MoviesView: MoviesViewController?
    var router: DetailMoviesRouterProtocol?
    
    func showMoviesModule(vc: UINavigationController) {
        self.router = DetailMoviesRouter()
        let interactor = MoviesInteractor()
        let presenter = MoviesPresenter(moviesInteractor: interactor,router: self)
        self.MoviesView =  MoviesViewController(presenter: presenter)
        presenter.view = self.MoviesView
        if let MoviesVC = self.MoviesView {
            vc.pushViewController(MoviesVC, animated: true)
        }
    }
    
    func goToDetailMovies(viewData: MovieEntity) {
        guard let fromViewController = MoviesView?.navigationController else { return }
        self.router?.showDetailMovieModule(navigation: fromViewController, viewData: viewData)
    }
    
}
