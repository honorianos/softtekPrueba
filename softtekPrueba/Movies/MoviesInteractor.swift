//
//  MoviesInteractor.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import Foundation
import Alamofire

protocol MoviesInteractorProtocol: AnyObject {
    typealias QueryResult = (DataResponse<Any>?) -> ()
    func getDataMovies(completion: @escaping QueryResult)
}

class MoviesInteractor: MoviesInteractorProtocol {
    typealias QueryResult = (DataResponse<Any>?) -> ()
    
    func getDataMovies(completion: @escaping QueryResult) {
        let uri = URL(string: Base.url + "popular?api_key=" + Base.urlKey)
        if let uri = uri {
            var request = URLRequest(url: uri)
            request.httpMethod = HTTPMethod.get.rawValue
            Alamofire.request(request).responseJSON{ (response) in
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
                if response.error != nil {
                    print(" ERORR** \(String(describing: response.error))")
                }
                DispatchQueue.main.async {
                    completion(response)
                }
            }
        }
    }
}
