//
//  Summary.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

/**
 Summary DTO model retrieved from API JSON data.
 */
struct Summary: Codable {
    let message: String?
    let global: Global?
    let countries: [Country]?
    let date: String?

    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case global = "Global"
        case countries = "Countries"
        case date = "Date"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        global = try values.decodeIfPresent(Global.self, forKey: .global)
        countries = try values.decodeIfPresent([Country].self, forKey: .countries)
        date = try values.decodeIfPresent(String.self, forKey: .date)
    }
}
