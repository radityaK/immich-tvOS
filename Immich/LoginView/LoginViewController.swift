//
//  LoginViewController.swift
//  Immich
//
//  Created by Raditya Kurnianto on 08/10/24.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var serverField: UITextField!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginAction(_ sender: Any) {
        guard let email = self.emailField.text, let pwd = self.passwordField.text, let server = self.serverField.text else { return }
        viewModel.provider = LoginProvider(email: email, password: pwd, server: server)
        
        viewModel.fetch()
    }
}
