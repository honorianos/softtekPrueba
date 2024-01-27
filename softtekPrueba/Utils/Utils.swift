//
//  Utils.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import Foundation
import UIKit

public class Utils{
    
    func showSimpleAlert(titulo: String, mensaje: String, vc: UIViewController, okBtn: String = UtilsText.Accept){
        let alertOffline = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alertOffline.addAction(UIAlertAction(title: okBtn, style: .default, handler: nil))
        vc.present(alertOffline, animated: true, completion: nil)
    }
    
    static func getUrlImageComplete(urlIncomplete : String) -> String {
        return Base.urlImage + urlIncomplete
    }
}

