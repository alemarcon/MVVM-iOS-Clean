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
    
    /// Get country data based on various parameters
    /// - Parameters:
    ///   - countrySlug: Country slug
    ///   - covidStatus: Covid status
    ///   - dateFrom: Date from
    ///   - dateTo: Date to
    func getCountryData(by countrySlug: String, covidStatus: Covid19Status, dateFrom: String, dateTo: String)
    
    /// Get all countries data
    func getCountryList()
    
}
