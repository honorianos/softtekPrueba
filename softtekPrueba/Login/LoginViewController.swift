//
//  LoginViewController.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var buttonHideShowPassword: UIButton!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapEnter(_ sender: Any) {
        
    }
    
    @IBAction func didTapToggleHide(_ sender: Any) {
        buttonHideShowPassword.isSelected = !buttonHideShowPassword.isSelected
        tfEmail.isSecureTextEntry = !buttonHideShowPassword.isSelected
    }
    
    
}
