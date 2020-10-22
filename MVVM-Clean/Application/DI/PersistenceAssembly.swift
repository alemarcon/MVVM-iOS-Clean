//
//  PersistenceAssembly.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Swinject

class PersistenceAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(SummaryPersistenceProtocolRequest.self) { resolver in
            let request = SummaryPersistenceRequest()
            return request
        }.inObjectScope(.transient)
        
        container.register(CountryPersistenceProtocolRequest.self) { resolver in
            let request = CountryPersistenceRequest()
            return request
        }.inObjectScope(.transient)
        
        container.register(ProfilePersistenceProtocolData.self) { resolver in
            let profile = ProfilePersistenceData()
            return profile
        }.inObjectScope(.transient)
        
    }
    
}
