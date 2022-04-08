//
//  SummaryNavigationRouter.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 07/04/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation

//MARK: - Protocol
protocol SummaryNavigationRouterInput {
    var vc: SummaryViewController! { get }
    
    func navigateToProfileView()
    func navigateToCountryView()
}

//MARK: - Implementation
class SummaryNavigationRouter: SummaryNavigationRouterInput {
    weak var vc: SummaryViewController!
    
    init(vc: SummaryViewController) {
        self.vc = vc
    }
    
    func navigateToProfileView() {
        let profileVC = ProfileNavigationConfigurator().configure()
        vc.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    func navigateToCountryView() {
        let countryVC = CountryNavigationConfigurator().configure()
        vc.navigationController?.pushViewController(countryVC, animated: true)
    }
    
}
