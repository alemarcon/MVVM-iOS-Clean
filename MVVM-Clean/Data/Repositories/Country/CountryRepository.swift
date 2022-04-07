//
//  CountryRepository.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class CountryRepository: CountryRepositoryDelegate {
    var countryNetwork: CountryNetworkProtocolRequest?
    var countryLocal: CountryPersistenceProtocolRequest?
    
    func getCountriesData(success: @escaping ([Country]) -> Void, failure: @escaping (CustomError) -> Void) {
        
        if let localCountriesData = countryLocal?.getLocalCountryDataDTO() {
            let localCountries = CountryDTOMapper.map(countries: localCountriesData)
            success(localCountries)
        } else {
            LOGE("CountryLocalProtocolRequest returned nil object")
            failure(CustomError.nilData)
        }
    }
    
    func getCountryData(by countrySlug: String, status: Covid19Status, from: String, to: String, success: @escaping ([Country]) -> Void, failure: @escaping (CustomError) -> Void) {
        
        countryNetwork?.getByCountryByStatus(countrySlug: countrySlug, status: status, from: from, to: to, success: { (response: [CountryDTO]) in
            LOGI("Data received")
            let countries = CountryDTOMapper.map(countries: response)
            success(countries)
        }, failure: { (response: CustomError) in
            failure(response)
        })
    }
    
}


//MARK: - Async
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
