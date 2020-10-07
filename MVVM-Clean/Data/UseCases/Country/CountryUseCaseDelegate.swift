//
//  CountryUseCaseDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 06/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol CountryUseCaseDelegate {
    
    //MARK: - Protocol properties
    var responseDelegate: CountryUseCaseResponseDelegate? { get set }
    var countryRepository: CountryRepositoryDelegate? { get set }
    
    /// <#Description#>
    /// - Parameters:
    ///   - countrySlug: <#countrySlug description#>
    ///   - covidStatus: <#covidStatus description#>
    ///   - dateFrom: <#dateFrom description#>
    ///   - dateTo: <#dateTo description#>
    func getCountryData(by countrySlug: String, covidStatus: Covid19Status, dateFrom: String, dateTo: String)
    
    func getCountryList()
    
}
