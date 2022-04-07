//
//  AuthNavigationConfigurator.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 07/04/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation
import Swinject

protocol AuthNavigationConfiguratorInput {
    func configure() -> LoginViewController
}

class AuthNavigationConfigurator: AuthNavigationConfiguratorInput {
    
    func configure() -> LoginViewController {
        guard let controller = Assembler.sharedAssembler.resolver.resolve(LoginViewController.self) else {
            LOGE("LoginViewController not resolved!")
            return LoginViewController()
        }
        return controller
    }
}
