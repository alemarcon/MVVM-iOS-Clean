//
//  ProfileViewController.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 17/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import UIKit
import Swinject
import Combine

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    var profileViewModel: ProfileViewModelDelegate?
    var subscriptions: Set<AnyCancellable> = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    private func bind() {
        
        profileViewModel?.status.sink { state in
            switch state {
            case .none:
                LOGP("No action")
                
            case .gettingUserData:
                LOGP("Getting user")
                
            case .gettingUserDataSuccess:
                LOGP("User data success")
                if let user = self.profileViewModel?.currentUser {
                    DispatchQueue.main.async {
                        self.usernameLabel.text = user.username
                    }
                }
            case .gettingUserDataFailure:
                LOGE("User data failed")
                self.showCancelAlert(title: "Error", message: self.profileViewModel?.error?.localizedErrorMessage ?? "")
                self.usernameLabel.text = "-"
                
            case .loggeoutProcessBegin:
                LOGP("Logout started")
                
            case .logoutProcessSuccess:
                LOGD("Logout success!")
                self.backToLoginViewController()
                
            case .logoutProcessFailure:
                self.showCancelAlert(title: "Error", message: self.profileViewModel?.error?.localizedErrorMessage ?? "")
                LOGE("Logout failed!")
            }
        }.store(in: &subscriptions)
        
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
