//
//  LoginRouter.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import Foundation
import UIKit

protocol LoginRouterProtocol: AnyObject {
    var LoginView: LoginViewController? { get }
    var router: MoviesRouterProtocol? { get }
    var navigationRoot: UINavigationController? { get }
    func showLoginModule(window: UIWindow?)
    func goToListMovies()
}

class LoginRouter: LoginRouterProtocol {
    var LoginView: LoginViewController?
    var router: MoviesRouterProtocol?
    var navigationRoot: UINavigationController?
    
    func showLoginModule(window: UIWindow?) {
        let interactor = LoginInteractor()
        router = MoviesRouter()
        let presenter = LoginPresenter(loginInteractor: interactor,router: self)
        LoginView =  LoginViewController(presenter: presenter)
        presenter.view = LoginView
        navigationRoot = UINavigationController(rootViewController: LoginViewController(presenter: presenter))
        window?.rootViewController = navigationRoot
        window?.makeKeyAndVisible()
    }
    
    func goToListMovies() {
        guard let fromViewController = navigationRoot else { return }
        self.router?.showMoviesModule(vc: fromViewController)
    }
    
}
