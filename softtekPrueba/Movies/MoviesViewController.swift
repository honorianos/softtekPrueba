//
//  MoviesViewController.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import UIKit
import JGProgressHUD

class MoviesViewController: UIViewController {
    
    private var presenter: MoviesPresenterProtocol?
    private var moviesList: [MovieEntity] = []
    private var filteredData: [MovieEntity] = []
    private let loader = JGProgressHUD(style: .light)
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    init(presenter: MoviesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSearch()
        initialTable()
        presenter?.onViewAppear()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initialMenu()
    }
    
    func loadData() {
        moviesList.removeAll()
    }
    
    override func viewDidLayoutSubviews() {
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.systemBackground.cgColor
    }
    
    func initialMenu() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = ColorBase.white
    }
    
    func initialTable() {
        collectionView.register(UINib(nibName: "MoviesCellTableViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "MoviesCellTableViewCell")
        loadData()
    }
    
    func initialSearch() {
        searchBar.delegate = self
    }
    
    func refreshCollectionView() {
        collectionView.reloadData()
    }
    
}

extension MoviesViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCellTableViewCell", for: indexPath) as? MoviesCellTableViewCell {
            cell.bindData(index: indexPath.item, data: filteredData[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }

}

extension MoviesViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter?.flowDetail(item: self.filteredData[indexPath.row])
    }
    
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width-45)/2
        return CGSize(width: width, height: (width*1.25))
    }
    
}

extension MoviesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText.isEmpty {
            filteredData = moviesList
        }
        else {
            for i in moviesList {
                if i.nameOfMovie.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(i)
                }
            }
        }
        self.collectionView.reloadData()
    }
}


extension MoviesViewController: MoviesViewUI {
    func presentMovies(movies: [MovieEntity]) {
        self.moviesList = movies
        self.filteredData = movies
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func showLoader() {
        DispatchQueue.main.async {
            self.loader.show(in: self.view)
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.loader.dismiss()
        }
    }
    
    func errorServer() {
        Utils.shared.showSimpleAlert(titulo: UtilsText.alertTittle, mensaje: UtilsText.errorServer, vc: self)
    }
    
    func errorParsing() {
        Utils.shared.showSimpleAlert(titulo: UtilsText.alertTittle, mensaje: UtilsText.errorMessage, vc: self)
    }
    
    func errorNetwork() {
        Utils.shared.showSimpleAlert(titulo: UtilsText.alertTittle, mensaje: UtilsText.errorMessageNetwork, vc: self)
    }
}
