//
//  Assembler+Extensions.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Swinject

extension Assembler {
    
    static var type: AssemblerType = .Default
    
    static let sharedAssembler: Assembler = {
        let container = Container()
        
        let assembler = Assembler([
            ViewControllerAssembly(),
            ViewModelAssembly(),
            RepositoryAssembly(),
            UseCaseAssembly(),
            MapperAssembly(),
            NetworkAssembly(),
            PersistenceAssembly()
        ], container: container)
        
        return assembler
    }()
}

enum AssemblerType {
    case Default
    case SummaryTest
}

