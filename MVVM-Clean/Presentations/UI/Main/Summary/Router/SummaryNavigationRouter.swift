//
//  SummaryNavigationRouter.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 07/04/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation
import Swinject

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
        if let profileViewController = Assembler.sharedAssembler.resolver.resolve(ProfileViewController.self) {
            vc.navigationController?.pushViewController(profileViewController, animated: true)
        }
    }
    
    func navigateToCountryView() {
        if let countriesViewController = Assembler.sharedAssembler.resolver.resolve(CountryListViewController.self) {
            vc.navigationController?.pushViewController(countriesViewController, animated: true)
        }
    }
    
}
