//
//  ProfileNavigationRouter.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 07/04/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Protocol
protocol ProfileNavigationRouterInput {
    var vc: ProfileViewController! { get }
    
    func navigateToLoginView()
}

//MARK: - Implementation
class ProfileNavigationRouter: ProfileNavigationRouterInput {
    weak var vc: ProfileViewController!
    
    init(vc: ProfileViewController) {
        self.vc = vc
    }
    
    func navigateToLoginView() {
        let authViewController = AuthNavigationConfigurator().configure()
        let nvc: UINavigationController = UINavigationController(rootViewController: authViewController)
        nvc.setNavigationBarHidden(false, animated: false)
        UIApplication.shared.windows.first?.rootViewController = nvc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    
}
