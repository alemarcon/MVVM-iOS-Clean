//
//  RepositoryAssembly.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Swinject

class RepositoryAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(SessionRepositoryDelegate.self) { resolver in
            return SessionRepository()
        }.inObjectScope(.transient)
        
        container.register(LoginRepositoryDelegate.self) { resolver in
            let loginRepo = LoginRepository()
            return loginRepo
        }.inObjectScope(.transient)
        
        container.register(LogoutRepositoryDelegate.self) { resolver in
            let logoutRepo = LogoutRepository()
            return logoutRepo
        }.inObjectScope(.transient)
        
        container.register(SummaryRepositoryDelegate.self) { resolver in
            let covidRepo = SummaryRepository()
            
            guard let summaryNetwork = resolver.resolve(SummaryNetworkProtocolRequest.self) else {
                fatalError("Assembler was unable to resolve SummaryNetworkProtocolRequest")
            }
            covidRepo.covidNetwork = summaryNetwork
            
            guard let summaryMapper = resolver.resolve(SummaryModelMapperDelegate.self) else {
                fatalError("Assembler was unable to resolve SummaryModelMapperDelegate")
            }
            covidRepo.summaryMapper = summaryMapper
            
            guard let summaryLocal = resolver.resolve(SummaryLocalProtocolRequest.self) else {
                fatalError("Assembler was unable to resolve SummaryLocalProtocolRequest")
            }
            covidRepo.summaryLocal = summaryLocal
            
            guard let countryLocal = resolver.resolve(CountryLocalProtocolRequest.self) else {
                fatalError("Assembler was unable to resolve CountryLocalProtocolRequest")
            }
            covidRepo.countryLocal = countryLocal
            
            guard let countryMapper = resolver.resolve(CountryModelMapperDelegate.self) else {
                fatalError("Assembler was unable to resolve CountryModelMapperDelegate")
            }
            covidRepo.countryMapper = countryMapper
            
            return covidRepo
        }.inObjectScope(.transient)
        
        container.register(CountryRepositoryDelegate.self) { resolver in
            let countryRepo = CountryRepository()
            
            guard let countryLocalData = resolver.resolve(CountryLocalProtocolRequest.self) else {
                fatalError("Assembler was unable to resolve CountryLocalProtocolRequest")
            }
            countryRepo.countryLocal = countryLocalData
            
            guard let countryMapper = resolver.resolve(CountryModelMapperDelegate.self) else {
                fatalError("Assembler was unable to resolve CountryModelMapperDelegate")
            }
            countryRepo.countryMapper = countryMapper
            
            guard let countryNetwork = resolver.resolve(CountryNetworkProtocolRequest.self) else {
                fatalError("Assembler was unable to resolve CountryNetworkProtocolRequest")
            }
            countryRepo.countryNetwork = countryNetwork
            
            return countryRepo
        }.inObjectScope(.transient)
        
    }
}

