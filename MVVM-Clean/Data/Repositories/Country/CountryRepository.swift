//
//  CountryRepository.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class CountryAsyncRepository: CountryRepositoryAsyncDelegate {
    
    var countryLocal: CountryPersistenceProtocolRequest?
    var countryAsyncNetwork: CountryNetworkProtocolAsyncRequest?
    
    func getCountriesAsyncData() async throws -> [Country] {
        if let localCountriesData = countryLocal?.getLocalCountryDataDTO() {
            let localCountries = CountryDTOMapper.map(countries: localCountriesData)
            return localCountries
        } else {
            LOGE("CountryLocalProtocolRequest returned nil object")
            throw CustomError.nilData
        }
    }
    
    func getCountryAsyncData(by countrySlug: String, status: Covid19Status, from: String, to: String) async throws -> [Country] {
        guard let data = try await countryAsyncNetwork?.getByCountryByStatus(countrySlug: countrySlug, status: status, from: from, to: to) else {
            throw CustomError.nilData
        }
        let countries = CountryDTOMapper.map(countries: data)
        return countries
    }
    
}
