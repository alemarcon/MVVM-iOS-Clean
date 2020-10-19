//
//  CountryModelMapperDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol CountryModelMapperDelegate {
    
    /// Map Country DTO object to CountryModel objecrt
    /// - Parameter country: Country object to map
    func mapToCountryModel(country: Country) -> CountryModel
    
    /// Map Country DTO object array to CountryModel objecrt array
    /// - Parameter countries: Country DTO object array to map
    func mapToCountryModelArray(countries: [Country]) -> [CountryModel]
}
