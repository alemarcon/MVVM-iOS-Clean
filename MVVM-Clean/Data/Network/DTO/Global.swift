//
//  Global.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

/**
 Global DTO model mapped from API JSON data
 */
struct Global: Codable {
    let newConfirmed: Int32?
    let totalConfirmed: Int32?
    let newDeaths: Int32?
    let totalDeaths: Int32?
    let newRecovered: Int32?
    let totalRecovered: Int32?

    enum CodingKeys: String, CodingKey {
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        newConfirmed = try values.decodeIfPresent(Int32.self, forKey: .newConfirmed)
        totalConfirmed = try values.decodeIfPresent(Int32.self, forKey: .totalConfirmed)
        newDeaths = try values.decodeIfPresent(Int32.self, forKey: .newDeaths)
        totalDeaths = try values.decodeIfPresent(Int32.self, forKey: .totalDeaths)
        newRecovered = try values.decodeIfPresent(Int32.self, forKey: .newRecovered)
        totalRecovered = try values.decodeIfPresent(Int32.self, forKey: .totalRecovered)
    }
}
