//
//  DatabaseService.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 26/01/24.
//

import Foundation
import SwiftData

class DatabaseServiceMovie {
    static var shared = DatabaseServiceMovie()
    var container: ModelContainer?
    var context: ModelContext?
    
    init() {
        do {
            let schema = Schema([ModelMovie.self,])
            let modelConfiguration = ModelConfiguration(schema: schema,isStoredInMemoryOnly: false)
            container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            if let container {
                context = ModelContext(container)
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func saveMovies(listMovies: [ModelMovie]?) {
        guard let listMovies
        else {
            print("error en Movies")
            return
        }
        for movie in listMovies {
            if !exist(id: movie.id) {
                context?.insert(movie)
            }
        }
    }
    
    func fetchData(onCompletion:@escaping([ModelMovie]?,Error?)->(Void)) {
        let descriptor = FetchDescriptor<ModelMovie>(sortBy: [SortDescriptor<ModelMovie>(\.id)])
        do {
            let data = try context?.fetch(descriptor)
            onCompletion(data,nil)
        }
        catch {
            onCompletion(nil,error)
        }
    }
    
    private func exist(id: Int)-> Bool {
        let descriptor = FetchDescriptor<ModelMovie>(sortBy: [SortDescriptor<ModelMovie>(\.id)])
        do {
            guard let data = try context?.fetch(descriptor) else { return false }
            for i in data {
                if i.id == id {
                    print("\(id) actualmente existe en la base de dato!")
                    return true
                }
            }
        }
        catch {
            return false
        }
        return false
    }
}
