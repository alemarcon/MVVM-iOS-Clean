//
//  CountryRepositoryDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol CountryRepositoryDelegate {
    
    //MARK: - Data object
    var countryLocal: CountryPersistenceProtocolRequest? { get set }
    var countryNetwork: CountryNetworkProtocolRequest? { get set }
    
    //MARK: - Mappers
    var countryMapper: CountryModelMapperDelegate? { get set }
    
    //MARK: - Methods
    
    /// Used to get all countries data.
    /// - Parameters:
    ///   - success: Event fired in success case
    ///   - failure: Event fired in failure case
    func getCountriesData(success: @escaping ([CountryModel])->Void, failure: @escaping (CustomError)->Void)
    
    /// Used to get country data filtered by various data.
    /// - Parameters:
    ///   - countrySlug: Country slug
    ///   - status: Covid status
    ///   - from: Date from
    ///   - to: Date to
    ///   - success: Event fired in success case
    ///   - failure: Event fired in failure case
    func getCountryData(by countrySlug: String, status: Covid19Status, from: String, to: String, success: @escaping ([CountryModel])->Void, failure: @escaping (CustomError)->Void)
    
}
