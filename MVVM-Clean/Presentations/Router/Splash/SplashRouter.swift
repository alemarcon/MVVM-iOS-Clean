//
//  SplashRouter.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 07/04/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation
import Swinject

class SplashRouter: SplashRouterInput {
//    weak var splashViewController: SplashViewController!
//
//    init(vc: SplashViewController) {
//        self.splashViewController = vc
//    }
    
    func navigateToHomeView() {
        LOGP("Navigate to home")
        if let mainViewController = Assembler.sharedAssembler.resolver.resolve(SummaryViewController.self) {
            let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
            nvc.setNavigationBarHidden(false, animated: false)
            UIApplication.shared.windows.first?.rootViewController = nvc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
    
    func navigateToLoginView() {
        LOGP("Navigate to login")
        if let loginViewController = Assembler.sharedAssembler.resolver.resolve(LoginViewController.self) {
            let nvc: UINavigationController = UINavigationController(rootViewController: loginViewController)
            nvc.setNavigationBarHidden(false, animated: false)
            UIApplication.shared.windows.first?.rootViewController = nvc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
    
}
