//
//  CountryNavigationRouter.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 08/04/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation

//MARK: - Protocol
protocol CountryNavigationRouterInput {
    var vc: CountryListViewController! { get }
}

//MARK: - Implementation
class CountryNavigationRouter: CountryNavigationRouterInput {
    weak var vc: CountryListViewController!
    
    init(vc: CountryListViewController) {
        self.vc = vc
    }
}
