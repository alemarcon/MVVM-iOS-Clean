//
//  CountryNetworkProtocolRequest.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 06/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

/// Covid19 Status accepted by country request
enum Covid19Status {
    case confirmed
    case recovered
    case deaths
}

/// Protocol for country request
protocol CountryNetworkProtocolAsyncRequest {
    
    /// Get country data by status and date with async API
    /// - Parameters:
    ///   - countrySlug: String rapresent country slug
    ///   - status: Covid19 status choose from Covid19Status enum
    ///   - from: Date to start collect data in format yyyy-mm-ddThh:MM:ssZ
    ///   - to: Date to end collect data in format yyyy-mm-ddThh:MM:ssZ
    /// - Returns: CountryDTO object
    func getByCountryByStatus(countrySlug: String, status: Covid19Status, from: String, to: String) async throws -> [CountryDTO]
}
