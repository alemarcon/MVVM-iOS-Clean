//
//  ViewControllerAssembly.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Swinject

class ViewControllerAssembly: Assembly {
    
    enum ViewControllerIds: String {
        case splash_vc
        case login_vc
        case main_vc
        case country_list_vc
    }
    
    func assemble(container: Container) {
        
        // Splash view controller initialization
        container.register(SplashViewController.self) { r in
            guard let controller: SplashViewController = UIStoryboard(.Splash).instantiateViewController(withIdentifier: ViewControllerIds.splash_vc.rawValue) as? SplashViewController else {
                fatalError("Assembler was unable to resolve SplashViewController")
            }
            guard let model = r.resolve(SplashScreenViewModelDelegate.self) else {
                fatalError("Assembler was unable to resolve SplashScreenViewModelDelegate")
            }
            controller.splashViewModel = model
            
            return controller
        }.inObjectScope(.transient)
        
        // Login View Controller
        container.register(LoginViewController.self) { r in
            guard let controller: LoginViewController = UIStoryboard(.Auth).instantiateViewController(withIdentifier: ViewControllerIds.login_vc.rawValue) as? LoginViewController else {
                fatalError("Assembler was unable to resolve LoginViewController")
            }
            
            guard let loginViewModel = r.resolve(LoginViewModelDelegate.self) else {
                fatalError("Assembler was unable to resolve LoginViewModelDelegate")
            }
            controller.loginViewModel = loginViewModel
            
            return controller
        }.inObjectScope(.transient)
        
        // Main View Controller
        container.register(SummaryViewController.self) { r in
            guard let controller: SummaryViewController = UIStoryboard(.Main).instantiateViewController(withIdentifier: ViewControllerIds.main_vc.rawValue) as? SummaryViewController else {
                fatalError("Assembler was unable to resolve MainViewController")
            }
            guard let sessionRepository = r.resolve(SessionRepositoryDelegate.self) else {
                fatalError("Assembler was unable to resolve SessionRepositoryDelegate")
            }
            controller.sessionRepository = sessionRepository
            
            guard let mainViewModel = r.resolve(SummaryCovidViewModelDelegate.self) else {
                fatalError("Assembler was unable to resolve MainViewModelDelegate")
            }
            controller.mainViewModel = mainViewModel
            return controller
        }.inObjectScope(.transient)
        
        // Countries list View Controller
        container.register(CountryListViewController.self) { r in
            guard let controller: CountryListViewController = UIStoryboard(.Main).instantiateViewController(withIdentifier: ViewControllerIds.country_list_vc.rawValue) as? CountryListViewController else {
                fatalError("Assembler was unable to resolve CountryListViewController")
            }
            
            guard let countryViewModel = r.resolve(CountryCovidViewModelDelegate.self) else {
                fatalError("Assembler was unable to resolve CountryCovidViewModelDelegate")
            }
            controller.countryViewModel = countryViewModel
            
            return controller
        }.inObjectScope(.transient)
        
    }
}
