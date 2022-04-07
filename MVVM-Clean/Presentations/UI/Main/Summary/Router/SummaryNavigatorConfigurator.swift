//
//  SummaryNavigatorConfigurator.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 07/04/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation
import Swinject

protocol SummaryNavigationConfiguratorInput {
    func configure() -> SummaryViewController
}

class SummaryNavigatorConfigurator: SummaryNavigationConfiguratorInput {
    
    func configure() -> SummaryViewController {
        guard let controller = Assembler.sharedAssembler.resolver.resolve(SummaryViewController.self) else {
            LOGE("SummaryViewController not resolved!")
            return SummaryViewController()
        } 
        return controller
    }
}
