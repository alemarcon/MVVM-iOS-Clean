//
//  CountryLocalProtocolRequest.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

/// Protocol
protocol CountryLocalProtocolRequest {
    
    /// Get country data saved locally. If there is no data, nil will be returned.
    func getLocalCountryData() ->[CountryModel]?
    
    /// Save CountryModel data array locally.
    /// - Parameter data: The CountryModel array to save locally
    func saveLocalCountries(data: [CountryModel])
}
