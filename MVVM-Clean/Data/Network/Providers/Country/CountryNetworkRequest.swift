//
//  CountryNetworkRequest.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 06/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class CountryNetworkRequest: CountryNetworkProtocolRequest {
    
    func getByCountryByStatus<T>(countrySlug: String, status: Covid19Status, from: String, to: String, success: @escaping (T) -> Void, failure: @escaping ((CustomError) -> Void)) where T : Decodable {
        let countryRouter = CountryRouter.getByCountryByStatus(countrySlug: countrySlug, status: status, from: from, to: to)
        _ = NetworkRequestPerfomer.performRequest(route: countryRouter, success: success, failure: failure)
    }
    
}
