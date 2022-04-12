//
//  CountryUseCaseDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 06/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol CountryUseCaseAsyncDelegate {
    
    //MARK: - Protocol properties
    var countryRepository: CountryRepositoryAsyncDelegate? { get }
    
    /// Get country data based on various parameters
    /// - Parameters:
    ///   - countrySlug: Country slug
    ///   - covidStatus: Covid status
    ///   - dateFrom: Date from
    ///   - dateTo: Date to
    func getCountryData(by countrySlug: String, covidStatus: Covid19Status, dateFrom: String, dateTo: String) async throws -> [Country]
    
    /// Get all countries data
    func getCountryList() async throws -> [Country]
    
}
