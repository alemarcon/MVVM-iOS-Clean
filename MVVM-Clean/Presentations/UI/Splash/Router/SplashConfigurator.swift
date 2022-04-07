//
//  SplashConfigurator.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 07/04/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation
import Swinject

protocol SplashConfiguratorInput {
    func configure() -> SplashViewController
}

class SplashConfigurator: SplashConfiguratorInput {
    
    func configure() -> SplashViewController {
        guard let controller = Assembler.sharedAssembler.resolver.resolve(SplashViewController.self) else {
            return SplashViewController()
        }
        
        return controller
    }
}
