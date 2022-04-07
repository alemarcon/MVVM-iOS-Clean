//
//  AuthNavigationRouter.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 07/04/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Protocol
protocol AuthNavigationRouterInput {
    var vc: LoginViewController! { get }
    
    func navigateToHomeView()
}

//MARK: - Implementation
class AuthNavigationRouter: AuthNavigationRouterInput {
    weak var vc: LoginViewController!
    
    init(vc: LoginViewController) {
        self.vc = vc
    }
    
    func navigateToHomeView() {
        let mainViewController = SummaryNavigatorConfigurator().configure()
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        nvc.setNavigationBarHidden(false, animated: false)
        UIApplication.shared.windows.first?.rootViewController = nvc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
