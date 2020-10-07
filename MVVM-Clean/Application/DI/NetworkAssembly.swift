//
//  NetworkAssembly.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Swinject

class NetworkAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(SummaryNetworkProtocolRequest.self) { resolver in
            let request = SummaryNetworkReqeust()
            return request
        }.inObjectScope(.transient)
        
        container.register(CountryNetworkProtocolRequest.self) { resolver in
            let request = CountryNetworkRequest()
            return request
        }.inObjectScope(.transient)
        
    }
    
}
