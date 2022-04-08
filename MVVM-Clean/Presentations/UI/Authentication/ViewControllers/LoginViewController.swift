//
//  LoginViewController.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import UIKit
import Combine

class LoginViewController: BaseViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var usernameTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    var router: AuthNavigationRouterInput?
    var loginViewModel: LoginViewModelDelegate?
    var subscriptions: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        localizeUI()
        bind()
    }
    
    /// Prepare all label with current localization.
    private func localizeUI() {
        titleLabel.text = NSLocalizedString("login_title", comment: "")
        subtitleLabel.text = NSLocalizedString("login_subtitle", comment: "")
        loginButton.setTitle(NSLocalizedString("login", comment: ""), for: .normal)
    }
    
    private func bind() {
        loginViewModel?.status.sink { state in
            switch state {
            case .none:
                LOGP("No action in progress")
            case .loginInProgress:
                LOGP("Login process begin")
                self.showLoading()
            case .loginSuccess:
                LOGP("Login success. Go to home")
                self.hideLoading()
                self.goestToHomeViewController()
            case .loginError:
                LOGP("Login error")
                self.hideLoading()
                let alertTitle = NSLocalizedString("alert_error_title", comment: "")
                self.showCancelAlert(title: alertTitle, message: self.loginViewModel?.error?.errorDescription ?? "Unknow error")
            }
        }.store(in: &subscriptions)

    }
    
    
    @IBAction func startLogin(_ sender: UIButton) {
        let username = usernameTextfield.text ?? ""
        let password = passwordTextfield.text ?? ""
        
        if( username == "" && password == "" ) {
            showCancelAlert(title: NSLocalizedString("alert_error_title", comment: ""), message: NSLocalizedString("empty_credential", comment: ""))
        } else if( !password.isValidPassword(minSizePassword: 8) ) {
            showCancelAlert(title: NSLocalizedString("alert_error_title", comment: ""), message: NSLocalizedString("wrong_password", comment: ""))
        } else {
            loginViewModel?.executeLogin(username: username, password: password)
        }
    }
    
    /// Get HomeViewCotroller and set as main window
    private func goestToHomeViewController() {
        router?.navigateToHomeView()
    }
    
}
