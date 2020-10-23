//
//  CountryDTOMapper.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

struct CountryDTOMapper {
    
    /// Map a single Country DTO object in a single CountryModel object
    /// - Parameter country: <#country description#>
    /// - Returns: <#description#>
    static func map(country: CountryDTO) -> Country {
        var countryModel = Country()
        
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
    
    /// Map a Country DTO object array in a CountryModel object array
    /// - Parameter countries: <#countries description#>
    /// - Returns: <#description#>
    static func map(countries: [CountryDTO]) -> [Country] {
        var countriesModel = [Country]()
        
        countries.forEach { (country) in
            countriesModel.append( map(country: country) )
        }
        
        return countriesModel
    }
    
}
