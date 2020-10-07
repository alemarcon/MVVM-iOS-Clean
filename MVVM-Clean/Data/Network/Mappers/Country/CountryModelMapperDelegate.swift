//
//  CountryModelMapperDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol CountryModelMapperDelegate {
    func mapToCountryModel(country: Country) -> CountryModel
    func mapToCountryModelArray(countries: [Country]) -> [CountryModel]
}
