//
//  ProfileNavigationConfigurator.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 07/04/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation
import Swinject

protocol ProfileNavigationConfiguratorInput {
    func configure() -> ProfileViewController
}

class ProfileNavigationConfigurator: ProfileNavigationConfiguratorInput {
    
    func configure() -> ProfileViewController {
        guard let controller = Assembler.sharedAssembler.resolver.resolve(ProfileViewController.self) else {
            LOGE("ProfileViewController not resolved!")
            return ProfileViewController()
        }
        return controller
    }
}
