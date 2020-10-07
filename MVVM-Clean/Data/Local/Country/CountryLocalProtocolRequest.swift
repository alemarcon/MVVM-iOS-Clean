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
    
    /// <#Description#>
    func getLocalCountryData() ->[CountryModel]?
    
    /// <#Description#>
    /// - Parameter data: <#data description#>
    func saveLocalCountries(data: [CountryModel])
}
