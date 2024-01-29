//
//  DetailMovieViewController.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import UIKit

class DetailMovieViewController: UIViewController {
    private let presenter: DetailMoviesPresenterProtocol
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var nameMovie: UILabel!
    @IBOutlet weak var overviewMovie: UILabel!
    @IBOutlet weak var dateRelease: UILabel!
    
    init(presenter: DetailMoviesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        self.presenter.onViewAppear()
    }
    
    func setupNavigation() {
        navigationController?.isNavigationBarHidden = false
    }
    
    func loadData(movie: MovieEntity) {
        let url = URL(string: Utils.getUrlImageComplete(urlIncomplete: movie.imageUrl ?? String()))
        imgMovie.kf.setImage(with: url)
        imgMovie.contentMode = .scaleAspectFit
        nameMovie.text = movie.nameOfMovie
        overviewMovie.text = movie.resume
        dateRelease.text = movie.releaseDate
    }
    



}

extension DetailMovieViewController: DetailMoviesUI {
    func presentMovies(movie: MovieEntity) {
        DispatchQueue.main.async {
            self.loadData(movie: movie)
        }
    }
}
