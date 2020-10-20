//
//  CountryModelMapper.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

/**
 The implementation of CountryModelMapperDelegate. Here we are going to map the Country DTO field to CountryModel. In this way we can map only the field we need.
 */
class CountryModelMapper: CountryModelMapperDelegate {
    
    func mapToCountryModel(country: Country) -> CountryModel {
        var countryModel = CountryModel()
        
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        
        countryModel.countryName = country.country ?? "Unknow"
        if let newConfirmed = country.newConfirmed {
            countryModel.newConfirmed = nf.string(from: NSNumber(value: newConfirmed)) ?? "0"
        }
        
        if let totalConfirmed = country.totalConfirmed {
            countryModel.totalConfirmed = nf.string(from: NSNumber(value: totalConfirmed)) ?? "0"
        }
        
        if let newRecovered = country.newRecovered {
            countryModel.newRecovered = nf.string(from: NSNumber(value: newRecovered)) ?? "0"
        }
        
        if let totalRecovered = country.totalRecovered {
            countryModel.totalRecovered = nf.string(from: NSNumber(value: totalRecovered)) ?? "0"
        }
        
        if let newDeath = country.newDeaths {
            countryModel.newDeaths = nf.string(from: NSNumber(value: newDeath)) ?? "0"
        }
        
        if let totalDeath = country.totalDeaths {
            countryModel.totalDeaths = nf.string(from: NSNumber(value: totalDeath)) ?? "0"
        }
        
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
