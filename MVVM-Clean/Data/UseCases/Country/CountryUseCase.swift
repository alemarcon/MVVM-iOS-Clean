//
//  CountryUseCase.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 06/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class CountryAsyncUseCase: CountryUseCaseAsyncDelegate {
    var countryRepository: CountryRepositoryAsyncDelegate?
    
    func getCountryData(by countrySlug: String, covidStatus: Covid19Status, dateFrom: String, dateTo: String) async throws -> [Country] {
        guard let country = try await countryRepository?.getCountryAsyncData(by: countrySlug, status: covidStatus, from: dateFrom, to: dateTo) else {
            throw CustomError.nilData
        }
        return country
    }
    
    func getCountryList() async throws -> [Country] {
        guard let country = try await countryRepository?.getCountriesAsyncData() else {
            throw CustomError.nilData
        }
        return country
    }
    
}
