//
//  ViewModelAssembly.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Swinject

class ViewModelAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(SplashScreenViewModelDelegate.self) { resolver in
            let splashViewModel = SplashScreenViewModel()
            
            guard let profileUseCase = resolver.resolve(ProfileUseCaseDelegate.self) else {
                fatalError("Assembler was unable to resolve ProfileUseCaseDelegate")
            }
            splashViewModel.profileUseCase = profileUseCase
            splashViewModel.profileUseCase?.responseDelegate = splashViewModel
            
            return splashViewModel
        }.inObjectScope(.transient)
        
        // Login View Model
        container.register(LoginViewModelDelegate.self) { resolver in
            let loginViewModel = LoginViewModel()
            
            guard let loginUseCase = resolver.resolve(LoginUseCaseDelegate.self) else {
                fatalError("Assembler was unable to resolve LoginUseCaseDelegate")
            }
            loginViewModel.loginUseCase = loginUseCase
            
            return loginViewModel
        }.inObjectScope(.transient)
        
        
        container.register(SummaryCovidViewModelDelegate.self) { resolver in
            let mainViewModel = SummaryCovidViewModel()
            guard let summaryUseCaseAsync = resolver.resolve(SummaryUseCaseAsyncDelegate.self) else {
                fatalError("Assembler was unable to resolve SummaryUseCaseDelegateAsync")
            }
            mainViewModel.summaryUseCaseAsync = summaryUseCaseAsync
            
            return mainViewModel
        }.inObjectScope(.transient)
        
        container.register(CountryCovidViewModelDelegate.self) { resolver in
            let countryViewModel = CountryCovidViewModel()
            
            guard let countryUseCase = resolver.resolve(CountryUseCaseDelegate.self) else {
                fatalError("Assembler was unable to resolve CountryUseCaseDelegate")
            }
            countryViewModel.countryUseCase = countryUseCase
            countryViewModel.countryUseCase?.responseDelegate = countryViewModel
            
            guard let countryAsyncUseCase = resolver.resolve(CountryUseCaseAsyncDelegate.self) else {
                fatalError("Assembler was unable to resolve CountryUseCaseAsyncDelegate")
            }
            countryViewModel.countryAsyncUseCase = countryAsyncUseCase
            
            return countryViewModel
        }.inObjectScope(.transient)
        
        container.register(ProfileViewModelDelegate.self) { resolver in
            let profileViewModel = ProfileViewModel()
            
            guard let profileUseCase = resolver.resolve(ProfileUseCaseDelegate.self) else {
                fatalError("Assembler was unable to resolve ProfileUseCaseDelegate")
            }
            profileViewModel.profileUseCase = profileUseCase
            profileViewModel.profileUseCase?.responseDelegate = profileViewModel
            
            return profileViewModel
        }.inObjectScope(.transient)
        
    }
}
