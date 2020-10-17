//
//  ProfileViewController.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 17/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import UIKit
import Swinject

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    var profileViewModel: ProfileViewModelDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    private func bind() {
        
        profileViewModel?.status.bind(to: view) { [weak self] view, _ in
            if let viewModel = self?.profileViewModel {
                switch viewModel.status.value {
                case .none:
                    LOGP("No action")
                    
                case .gettingUserData:
                    LOGP("Getting user")
                    
                case .gettingUserDataSuccess:
                    LOGP("User data success")
                    if let user = viewModel.currentUser {
                        DispatchQueue.main.async {
                            self?.usernameLabel.text = user.username
                        }
                    }
                    
                case .gettingUserDataFailure:
                    LOGE("User data failed")
                    self?.showCancelAlert(title: "Error", message: viewModel.error?.localizedErrorMessage ?? "")
                    self?.usernameLabel.text = "-"
                    
                case .loggeoutProcessBegin:
                    LOGP("Logout started")
                    
                case .logoutProcessSuccess:
                    LOGD("Logout success!")
                    self?.backToLoginViewController()
                    
                case .logoutProcessFailure:
                    self?.showCancelAlert(title: "Error", message: viewModel.error?.localizedErrorMessage ?? "")
                    LOGE("Logout failed!")
                }
            }
        }
        
        loadUserData()
    }
    
    private func loadUserData() {
        profileViewModel?.getUserData()
    }
    
    @IBAction func executeLogout(_ sender: UIButton) {
        profileViewModel?.logoutUser()
    }
    
    
    private func backToLoginViewController() {
        if let loginViewController = Assembler.sharedAssembler.resolver.resolve(LoginViewController.self) {
            let nvc: UINavigationController = UINavigationController(rootViewController: loginViewController)
            nvc.setNavigationBarHidden(true, animated: false)
            UIApplication.shared.keyWindow?.rootViewController = nvc
        }
    }
}
