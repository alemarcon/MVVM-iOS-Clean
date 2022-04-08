//
//  CountryNavigationConfigurator.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 08/04/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation
import Swinject

protocol CountryNavigationConfiguratorInput {
    func configure() -> CountryListViewController
}

class CountryNavigationConfigurator: CountryNavigationConfiguratorInput {
    
    func configure() -> CountryListViewController {
        guard let controller = Assembler.sharedAssembler.resolver.resolve(CountryListViewController.self) else {
            LOGE("CountryListViewController not resolved!")
            return CountryListViewController()
        }
        return controller
    }
}
