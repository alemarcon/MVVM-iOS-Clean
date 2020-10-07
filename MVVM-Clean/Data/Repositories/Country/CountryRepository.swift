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
    var countryLocal: CountryLocalProtocolRequest?
    var countryMapper: CountryModelMapperDelegate?
    
    func getCountriesData(success: @escaping ([CountryModel]) -> Void, failure: @escaping (CustomError) -> Void) {
        
        if let localCountriesData = countryLocal?.getLocalCountryData() {
            success(localCountriesData)
        } else {
            LOGE("CountryLocalProtocolRequest returned nil object")
            let customError = CustomError()
            customError.errorMessage = "CountryLocalProtocolRequest returned nil object"
            customError.localizedErrorMessage = NSLocalizedString("country_mapper_error", comment: "")
            failure(customError)
        }
    }
    
    func getCountryData(by countrySlug: String, status: Covid19Status, from: String, to: String, success: @escaping ([CountryModel]) -> Void, failure: @escaping (CustomError) -> Void) {
        
        countryNetwork?.getByCountryByStatus(countrySlug: countrySlug, status: status, from: from, to: to, success: { (response: [Country]) in
            LOGI("Data received")
            if let countries = self.countryMapper?.mapToCountryModelArray(countries: response) {
                success(countries)
            } else {
                LOGE("Countries model mapper or response is nil")
                let customError = CustomError()
                customError.errorMessage = "CountryModelMapper or response is nil"
                customError.localizedErrorMessage = NSLocalizedString("country_mapper_error", comment: "")
                failure(customError)
            }
        }, failure: { (response: CustomError) in
            failure(response)
        })
    }
    
}
