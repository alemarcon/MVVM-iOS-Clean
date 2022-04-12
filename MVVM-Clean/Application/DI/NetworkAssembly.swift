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
        
        //MARK: - Async
        container.register(SummaryNetworkProtocolAsyncRequest.self) { resolver in
            
            if( Assembler.type == .SummaryTest ) {
                let summaryDataReuqest = SummaryDataRequestTest()
                return summaryDataReuqest
            } else {
                return SummaryNetworkAsyncReqeust()
            }

        }.inObjectScope(.transient)
        
        container.register(CountryNetworkProtocolAsyncRequest.self) { resolver in
            let request = CountryNetworkAsyncRequest()
            return request
        }.inObjectScope(.transient)
        
    }
    
}
