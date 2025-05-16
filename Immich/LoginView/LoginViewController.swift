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
        self.emailField.text = "raditya.kurnianto@gmail.com"
        self.passwordField.text = "kania1234"
        self.serverField.text = "https://photos.gardenia-cloud.my.id/api"
        
        viewModel.onDataLoad = { [weak self] (user) in
            let controller = HomeController()
            self?.navigationController?.setViewControllers([controller], animated: true)
        }
    }

    @IBAction func loginAction(_ sender: Any) {
        guard let email = self.emailField.text, let pwd = self.passwordField.text, let server = self.serverField.text else { return }
        viewModel.provider = LoginProvider(email: email, password: pwd, server: server)
        
        viewModel.fetch()
    }
}
