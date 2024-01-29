//
//  LoginPresenter.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import Foundation
import UIKit

protocol LoginViewPresenterProtocol: AnyObject {
    var view: LoginViewUI? { get }
    func validateUser(user: String, password: String)
    func flowToListOfMovies()
}

protocol LoginViewUI: AnyObject {
    func errorUser()
    func errorDefault()
}

class LoginPresenter: LoginViewPresenterProtocol {
    weak var view: LoginViewUI?
    private let utils = Utils()
    private let loginInteractor: LoginInteractorProtocol
    private var router: LoginRouterProtocol
    
    init(loginInteractor: LoginInteractorProtocol,router: LoginRouterProtocol) {
        self.loginInteractor = loginInteractor
        self.router = router
    }
    
    func validateUser(user: String, password: String) {
        let userToValidated = LoginEntity(user: user, password: password)
        switch loginInteractor.validateUser(user: userToValidated) {
        case true:
            print("usuario valido")
            flowToListOfMovies()
        case false:
            view?.errorUser()
            print("usuario no valido")
        default:
            view?.errorDefault()
            print("ocurrio un error en validacion del usuario \(userToValidated)")
        }
    }
    
    func flowToListOfMovies() {
        router.goToListMovies()
    }
}
