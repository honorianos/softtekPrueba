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
    func getDataMovies()-> String?
}

extension MoviesInteractorProtocol {
    func getDataMovies(completion: @escaping QueryResult) {}
    func getDataMovies()-> String? { String() }
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

//MARK: LoginTesteable Moock
class MoviesInteractorMoock: MoviesInteractorProtocol {
    
    func getDataMovies()-> String? {
        let datos: [String: Any] = [
            "id": 906126,
            "original_language": "es",
            "original_title": "La sociedad de la nieve",
            "overview": "On October 13, 1972, Uruguayan Air Force Flight 571, chartered to take a rugby team to Chile, crashes into a glacier in the heart of the Andes.",
            "popularity": 1060.455,
            "poster_path": "/2e853FDVSIso600RqAMunPxiZjq.jpg",
            "release_date": "2023-12-13",
            "title": "Society of the Snow",
            "video": false,
            "vote_average": 8.097,
            "vote_count": 1462
        ]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: datos, options: .prettyPrinted)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                return jsonString
            }
        } catch {
            print("Error al convertir datos a JSON: \(error.localizedDescription)")
        }
        return nil
    }
}
