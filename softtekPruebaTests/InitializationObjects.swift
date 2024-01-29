//
//  InitializationObjects.swift
//  softtekPruebaTests
//
//  Created by Oswaldo Escobar Huisa on 29/01/24.
//

import XCTest

@testable import softtekPrueba

final class InitializationObjects: XCTestCase {

//    MARK: Login Object
    func testInitializationLoginObject() {
        let user = "user"
        let password = "password"
        let userEntity = LoginEntity(user: user, password: password)
        
        XCTAssertEqual(userEntity.user, user)
        XCTAssertEqual(userEntity.password, password)
        
    }
    
    //    MARK: Movie Object
        func testInitializationMovieObject() {
            let id = 906126
            let imageUrl = "/2e853FDVSIso600RqAMunPxiZjq.jpg"
            let nameOfMovie = "Society of the Snow"
            let note = 8.097
            let releaseDate = "2023-12-13"
            let resume = "On October 13, 1972, Uruguayan Air Force Flight 571, chartered to take a rugby team to Chile, crashes into a glacier in the heart of the Andes."
            let movieEntity = MovieEntity(id: id,
                                         imageUrl: imageUrl,
                                         nameOfMovie: nameOfMovie,
                                         note: Float(note),
                                         releaseDate: releaseDate,
                                         resume: resume
            )
            XCTAssertEqual(movieEntity.id, id)
            XCTAssertEqual(movieEntity.imageUrl, imageUrl)
            XCTAssertEqual(movieEntity.nameOfMovie, nameOfMovie)
            XCTAssertEqual(movieEntity.note, Float(note))
            XCTAssertEqual(movieEntity.releaseDate, releaseDate)
            XCTAssertEqual(movieEntity.resume, resume)
            
        }
}
