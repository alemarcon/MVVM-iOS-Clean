//
//  UseCaseAssembly.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Swinject


class UseCaseAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(LoginUseCaseDelegate.self) { resolver in
            let loginUseCase = LoginUseCase()
            guard let loginRepository = resolver.resolve(LoginRepositoryDelegate.self) else {
                fatalError("Assembler was unable to resolve LoginRepositoryDelegate")
            }
            loginUseCase.loginRepository = loginRepository
            return loginUseCase
        }.inObjectScope(.transient)
        
        container.register(LogoutUseCaseDelegate.self) { resolver in
            let logoutUseCase = LogoutUseCase()
            guard let logoutRepository = resolver.resolve(LogoutRepositoryDelegate.self) else {
                fatalError("Assembler was unable to resolve LogoutRepositoryDelegate")
            }
            logoutUseCase.logoutRepository = logoutRepository
            return logoutUseCase
        }.inObjectScope(.transient)
        
        
        container.register(SummaryUseCaseDelegate.self) { resolver in
            let covidUseCase = SummaryUseCase()
            guard let summaryRepository = resolver.resolve(SummaryRepositoryDelegate.self) else {
                fatalError("Assembler was unable to resolve Covid19RepositoryDelegate")
            }
            covidUseCase.summaryRepository = summaryRepository
            
            return covidUseCase
        }.inObjectScope(.transient)
        
        container.register(CountryUseCaseDelegate.self) { resolver in
            let countryUseCase = CountryUseCase()
            guard let countryRepository = resolver.resolve(CountryRepositoryDelegate.self) else {
                fatalError("Assembler was unable to resolve CountryRepositoryDelegate")
            }
            countryUseCase.countryRepository = countryRepository
            
            return countryUseCase
        }.inObjectScope(.transient)
        
    }
}

