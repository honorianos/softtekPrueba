//
//  DetailMoviesRouter.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import Foundation
import UIKit

protocol DetailMoviesRouterProtocol {
    func showDetailMovieModule(navigation: UINavigationController, viewData: MovieEntity)
}

class DetailMoviesRouter: DetailMoviesRouterProtocol {
    
    func showDetailMovieModule(navigation: UINavigationController, viewData: MovieEntity) {
        let interactor = DetailMoviesInteractor()
        let presenter = DetailMoviesPresenter(detailMovieInteractor: interactor, viewData: viewData)
        let view =  DetailMovieViewController(presenter: presenter)
        presenter.view = view
        navigation.pushViewController(view, animated: true)
    }
    
}


