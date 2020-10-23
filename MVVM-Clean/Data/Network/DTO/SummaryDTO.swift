//
//  SummaryDTO.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

/**
 Summary DTO model retrieved from API JSON data.
 */
struct SummaryDTO: Codable {
    let message: String?
    let global: GlobalDTO?
    let countries: [CountryDTO]?
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
        global = try values.decodeIfPresent(GlobalDTO.self, forKey: .global)
        countries = try values.decodeIfPresent([CountryDTO].self, forKey: .countries)
        date = try values.decodeIfPresent(String.self, forKey: .date)
    }
}
