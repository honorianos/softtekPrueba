//
//  MoviesObject.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 26/01/24.
//

import Foundation
import SwiftData

@Model
class ModelMovie {
    // MARK: - attributes
    
    @Attribute(.unique) var id = Int()
    var imageUrl = String()
    var name = String()
    var note = String()
    var releaseDate = String()
    var resume = String()
    
    init(id: Int = Int(), imageUrl: String = String(), name: String = String(), note: String = String(), releaseDate: String = String(), resume: String = String()) {
        self.id = id
        self.imageUrl = imageUrl
        self.name = name
        self.note = note
        self.releaseDate = releaseDate
        self.resume = resume
    }
    
    
}
