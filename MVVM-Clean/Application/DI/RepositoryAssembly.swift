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
        
        container.register(ProfileRepositoryDelegate.self) { resolver in
            let profileRepository = ProfileRepository()
            
            guard let profileProtocol = resolver.resolve(ProfilePersistenceProtocolData.self) else {
                fatalError("Assembler was unable to resolve ProfileLocalProtocolData")
            }
            profileRepository.profileLocalData = profileProtocol
            
            return profileRepository
        }.inObjectScope(.transient)
        
        container.register(LoginRepositoryDelegate.self) { resolver in
            let loginRepo = LoginRepository()
            guard let profileProtocol = resolver.resolve(ProfilePersistenceProtocolData.self) else {
                fatalError("Assembler was unable to resolve ProfileLocalProtocolData")
            }
            loginRepo.profileProtocol = profileProtocol
            
            return loginRepo
        }.inObjectScope(.transient)
        
        container.register(SummaryRepositoryDelegate.self) { resolver in
            let covidRepo = SummaryRepository()
            
            guard let summaryNetwork = resolver.resolve(SummaryNetworkProtocolRequest.self) else {
                fatalError("Assembler was unable to resolve SummaryNetworkProtocolRequest")
            }
            covidRepo.covidNetwork = summaryNetwork
            
            guard let summaryLocal = resolver.resolve(SummaryPersistenceProtocolRequest.self) else {
                fatalError("Assembler was unable to resolve SummaryLocalProtocolRequest")
            }
            covidRepo.summaryLocal = summaryLocal
            
            guard let countryLocal = resolver.resolve(CountryPersistenceProtocolRequest.self) else {
                fatalError("Assembler was unable to resolve CountryLocalProtocolRequest")
            }
            covidRepo.countryLocal = countryLocal
            
            return covidRepo
        }.inObjectScope(.transient)
        
        container.register(CountryRepositoryDelegate.self) { resolver in
            let countryRepo = CountryRepository()
            
            guard let countryLocalData = resolver.resolve(CountryPersistenceProtocolRequest.self) else {
                fatalError("Assembler was unable to resolve CountryLocalProtocolRequest")
            }
            countryRepo.countryLocal = countryLocalData
            
            guard let countryNetwork = resolver.resolve(CountryNetworkProtocolRequest.self) else {
                fatalError("Assembler was unable to resolve CountryNetworkProtocolRequest")
            }
            countryRepo.countryNetwork = countryNetwork
            
            return countryRepo
        }.inObjectScope(.transient)
        
    }
}

