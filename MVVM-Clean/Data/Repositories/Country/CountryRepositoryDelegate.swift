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
    var countryLocal: CountryLocalProtocolRequest? { get set }
    var countryNetwork: CountryNetworkProtocolRequest? { get set }
    
    //MARK: - Mappers
    var countryMapper: CountryModelMapperDelegate? { get set }
    
    //MARK: - Methods
    
    /// <#Description#>
    /// - Parameters:
    ///   - success: <#success description#>
    ///   - failure: <#failure description#>
    func getCountriesData(success: @escaping ([CountryModel])->Void, failure: @escaping (CustomError)->Void)
    
    /// <#Description#>
    /// - Parameters:
    ///   - countrySlug: <#countrySlug description#>
    ///   - status: <#status description#>
    ///   - from: <#from description#>
    ///   - to: <#to description#>
    ///   - success: <#success description#>
    ///   - failure: <#failure description#>
    func getCountryData(by countrySlug: String, status: Covid19Status, from: String, to: String, success: @escaping ([CountryModel])->Void, failure: @escaping (CustomError)->Void)
    
}
