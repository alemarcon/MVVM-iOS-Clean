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
protocol CountryNetworkProtocolRequest {
    
    /// Get country data by status and date
    /// - Parameters:
    ///   - countrySlug: String rapresent country slug
    ///   - status: Covid19 status choose from Covid19Status enum
    ///   - from: Date to start collect data in format yyyy-mm-ddThh:MM:ssZ
    ///   - to: Date to end collect data in format yyyy-mm-ddThh:MM:ssZ
    ///   - success: Success case
    ///   - failure: Failure case
    func getByCountryByStatus<T: Decodable>(countrySlug: String, status: Covid19Status, from: String, to: String, success: @escaping (T) -> Void, failure: @escaping ((CustomError) -> Void))
}
