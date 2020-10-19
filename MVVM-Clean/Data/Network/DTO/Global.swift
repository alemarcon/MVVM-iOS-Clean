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
}
