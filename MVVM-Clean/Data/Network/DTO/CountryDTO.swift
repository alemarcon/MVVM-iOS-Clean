//
//  CountryDTO.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

/**
 Country DTO model mapped from API JSON data
 */
struct CountryDTO: Codable {
    let country: String?
    let countryCode: String?
    let slug: String?
    let newConfirmed: Int32?
    let totalConfirmed: Int32?
    let newDeaths: Int32?
    let totalDeaths: Int32?
    let newRecovered: Int32?
    let totalRecovered: Int32?
    let date: String?

    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case slug = "Slug"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
        case date = "Date"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        country = try values.decodeIfPresent(String.self, forKey: .country)
        countryCode = try values.decodeIfPresent(String.self, forKey: .countryCode)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        newConfirmed = try values.decodeIfPresent(Int32.self, forKey: .newConfirmed)
        
        totalConfirmed = try values.decodeIfPresent(Int32.self, forKey: .totalConfirmed)
        newDeaths = try values.decodeIfPresent(Int32.self, forKey: .newDeaths)
        totalDeaths = try values.decodeIfPresent(Int32.self, forKey: .totalDeaths)
        newRecovered = try values.decodeIfPresent(Int32.self, forKey: .newRecovered)
        
        totalRecovered = try values.decodeIfPresent(Int32.self, forKey: .totalRecovered)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        
    }
}
