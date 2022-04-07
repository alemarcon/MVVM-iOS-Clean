//
//  SplashRouter.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 07/04/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Protocol
protocol SplashRouterInput {
    func navigateToHomeView()
    func navigateToLoginView()
}

//MARK: - Implementation
class SplashRouter: SplashRouterInput {
    
    func navigateToHomeView() {
        LOGP("Navigate to home")
        let mainViewController = SummaryNavigatorConfigurator().configure()
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        nvc.setNavigationBarHidden(false, animated: false)
        UIApplication.shared.windows.first?.rootViewController = nvc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func navigateToLoginView() {
        LOGP("Navigate to login")
        let loginViewController = AuthNavigationConfigurator().configure()
        let nvc: UINavigationController = UINavigationController(rootViewController: loginViewController)
        nvc.setNavigationBarHidden(false, animated: false)
        UIApplication.shared.windows.first?.rootViewController = nvc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
}
