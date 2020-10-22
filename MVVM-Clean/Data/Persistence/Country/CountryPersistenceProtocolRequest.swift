//
//  CountryPersistenceProtocolRequest.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

/// Protocol
protocol CountryPersistenceProtocolRequest {
    
    /// Save CountryModel data array locally.
    /// - Parameter data: The Country dto array to save locally
    func saveLocalCountryDataDTO(data: [Country])
    
    /// Get country data saved locally. If there is no data, nil will be returned.
    func getLocalCountryDataDTO() -> [Country]?
}
