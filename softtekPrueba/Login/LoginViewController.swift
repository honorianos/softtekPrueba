//
//  LoginViewController.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var presenter: LoginViewPresenterProtocol
    
    init(presenter: LoginViewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var buttonHideShowPassword: UIButton!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    

    
    @IBAction func didTapEnter(_ sender: Any) {
        presenter.validateUser(user: tfEmail.text ?? String(), password: tfPassword.text ?? String())
    }
    
    @IBAction func didTapToggleHide(_ sender: Any) {
        buttonHideShowPassword.isSelected = !buttonHideShowPassword.isSelected
        tfEmail.isSecureTextEntry = !buttonHideShowPassword.isSelected
    }
    
    
}

extension LoginViewController: LoginViewUI {
    func errorUser(navigationRoot: UINavigationController) {
        let alertOffline = UIAlertController(title: UtilsText.alertTittle, message: UtilsText.errorUser, preferredStyle: .alert)
        alertOffline.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        navigationRoot.present(alertOffline, animated: true, completion: nil)
    }
}
