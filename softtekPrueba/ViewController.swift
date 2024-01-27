//
//  ViewController.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 26/01/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DatabaseServiceMovie.shared.saveMovies(listMovies: [ModelMovie(id: 0, imageUrl: "/qhb1qOilapbapxWQn9jtRCMwXJF.jpg", name: "1", note: "Wonka", releaseDate: "2023-12-06", resume: "Willy Wonka 2013 chock-full of ideas and determined to change the world one delectable bite at a time 2013 is proof that the best things in life begin with a dream, and if you 2019re lucky enough to meet Willy Wonka, anything is possible.")])
        
        DatabaseServiceMovie.shared.fetchData(onCompletion: { data,error  in
            if let data {
                print(data)
            }
        })
        // Do any additional setup after loading the view.
    }


}

