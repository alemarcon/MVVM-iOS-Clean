//
//  Summary.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

// MARK: - Summary
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
}
