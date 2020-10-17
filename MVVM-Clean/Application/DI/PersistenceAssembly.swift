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
        
        container.register(SummaryLocalProtocolRequest.self) { resolver in
            let request = SummaryLocalRequest()
            return request
        }.inObjectScope(.transient)
        
        container.register(CountryLocalProtocolRequest.self) { resolver in
            let request = CountryLocalRequest()
            return request
        }.inObjectScope(.transient)
        
        container.register(ProfileLocalProtocolData.self) { resolver in
            let profile = ProfileLocalData()
            return profile
        }.inObjectScope(.transient)
        
    }
    
}
