//
//  CountryNetworkRequest.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 06/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class CountryNetworkAsyncRequest: CountryNetworkProtocolAsyncRequest {

    func getByCountryByStatus(countrySlug: String, status: Covid19Status, from: String, to: String) async throws -> [CountryDTO] {
        let countryRouter = CountryRouterSwift.getByCountryByStatus(countrySlug: countrySlug, status: status, from: from, to: to)
        return try await AsyncNetworkPerformer.sendRequest(route: countryRouter, responseDTO: [CountryDTO].self)
    }
}
