//
//  ViewInitializationTest.swift
//  softtekPruebaTests
//
//  Created by Oswaldo Escobar Huisa on 29/01/24.
//

import XCTest
@testable import softtekPrueba

final class ViewInitializationTest: XCTestCase {
    //    MARK: Login Initialized
    let routerLogin = LoginRouter()
    let interactorLogin = LoginInteractor()
    
    //    MARK: Movie Initialized
    let routerMovie = MoviesRouter()
    let interactorMovie = MoviesInteractor()
    
    //    MARK: DetailMovie Initialized
    let routerDetailMovie = DetailMoviesRouter()
    let interactorDetailMovie = DetailMoviesInteractor()
    let movieEntity = MovieEntity(id: Int(), imageUrl: String(), nameOfMovie: String(), note: Float(), releaseDate: String(), resume: String())
    
    //    MARK: Login Initialized View
    func testViewLogin() {
        let presenter = LoginPresenter(loginInteractor: interactorLogin,router: routerLogin)
        let loginView =  LoginViewController(presenter: presenter)
        XCTAssertNotNil(loginView)
    }
    
    //    MARK: Movie Initialized View
    func testViewMovie() {
        let presenter = MoviesPresenter(moviesInteractor: interactorMovie,router: routerMovie)
        let movieView =  MoviesViewController(presenter: presenter)
        XCTAssertNotNil(movieView)
    }
    
    //    MARK: DetailMovie Initialized View
    func testViewDetailMovie() {
        let presenter = DetailMoviesPresenter(detailMovieInteractor: interactorDetailMovie, viewData: movieEntity)
        let movieView =  DetailMovieViewController(presenter: presenter)
        XCTAssertNotNil(movieView)
    }
}
