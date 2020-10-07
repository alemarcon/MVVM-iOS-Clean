//
//  CountryModelMapper.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class CountryModelMapper: CountryModelMapperDelegate {
    
    func mapToCountryModel(country: Country) -> CountryModel {
        let countryModel = CountryModel()
        countryModel.countryName = country.country ?? "Unknow"
        countryModel.newConfirmed = country.newConfirmed ?? 0
        countryModel.totalConfirmed = country.totalConfirmed ?? 0
        countryModel.newRecovered = country.newRecovered ?? 0
        countryModel.totalRecovered = country.totalRecovered ?? 0
        countryModel.newDeaths = country.newDeaths ?? 0
        countryModel.totalDeaths = country.totalDeaths ?? 0
        
        return countryModel
    }
    
    func mapToCountryModelArray(countries: [Country]) -> [CountryModel] {
        var countriesModel = [CountryModel]()
        
        countries.forEach { (country) in
            countriesModel.append( mapToCountryModel(country: country) )
        }
        
        return countriesModel
    }
}
