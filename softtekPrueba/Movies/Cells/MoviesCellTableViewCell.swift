//
//  MoviesCellTableViewCell.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import UIKit
import Kingfisher

class MoviesCellTableViewCell: UICollectionViewCell {

    @IBOutlet weak var imageCategory: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    
    
    func bindData(index: Int, data: MovieEntity) {
        let url = URL(string: Utils.getUrlImageComplete(urlIncomplete: data.imageUrl ?? String()))
        imageCategory.kf.setImage(with: url)
        imageCategory.contentMode = .scaleToFill
        labelName.text = data.nameOfMovie
        labelDate.text = String(data.id)
    }
}
