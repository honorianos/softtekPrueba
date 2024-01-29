//
//  LoginInteractor.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import Foundation
import Alamofire

protocol LoginInteractorProtocol: AnyObject {
    func validateUser(user:LoginEntity)-> Bool
}

class LoginInteractor: LoginInteractorProtocol {
    typealias QueryResult = (DataResponse<Any>?) -> ()
    
    func validateUser(user:LoginEntity)-> Bool {
        if user.user.contains("Admin") && user.password.contains("Password*123.") {
            return true
        }
       return false
    }
    
    
}

//MARK: LoginTesteable Moock
class LoginInteractorMoock: LoginInteractorProtocol {
    typealias QueryResult = (DataResponse<Any>?) -> ()
    
    func validateUser(user:LoginEntity)-> Bool {
        if user.user.contains("Admin") && user.password.contains("123") {
            return true
        }
        return true
    }
}
