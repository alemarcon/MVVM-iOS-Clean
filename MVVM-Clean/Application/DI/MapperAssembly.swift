//
//  MapperAssembly.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Swinject

class MapperAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(SummaryModelMapperDelegate.self) { resolver in
            return SummayModelMapper()
        }.inObjectScope(.transient)
        
        container.register(CountryModelMapperDelegate.self) { resolver in
            return CountryModelMapper()
        }.inObjectScope(.transient)
        
    }
}
