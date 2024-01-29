//
//  ServiceTest.swift
//  softtekPruebaTests
//
//  Created by Oswaldo Escobar Huisa on 29/01/24.
//

import XCTest
@testable import softtekPrueba

final class ServiceTest: XCTestCase {
    //    MARK: Login Interactor
    let serviceLogin = LoginInteractorMoock()
    
    //    MARK: Login Interactor
    let serviceMovie = MoviesInteractorMoock()
    
    //    MARK: Login Service
    func testServiceLogin() {
        let result = serviceLogin.validateUser(user: LoginEntity(user: "Admin", password: "123"))
        XCTAssertTrue(result)
    }
    
    //    MARK: Login Service
    func testServiceMovies() {
        let result = serviceMovie.getDataMovies()
        XCTAssertNotNil(result)
    }
    
}
