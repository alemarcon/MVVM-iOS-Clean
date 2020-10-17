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
        
        container.register(ProfileUseCaseDelegate.self) { resolver in
            let profileUseCase = ProfileUseCase()
            guard let profileRepository = resolver.resolve(ProfileRepositoryDelegate.self) else {
                fatalError("Assembler was unable to resolve ProfileRepositoryDelegate")
            }
            profileUseCase.profileRepository = profileRepository
            return profileUseCase
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

