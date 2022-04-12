//
//  Covid19NetworkRequest.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class SummaryNetworkAsyncReqeust: SummaryNetworkProtocolAsyncRequest {
    
    func getSummaryData() async throws -> SummaryDTO {
        let covidAsyncRouter = SummaryRouterSwift.getSummaryData
        return try await AsyncNetworkPerformer.sendRequest(route: covidAsyncRouter, responseDTO: SummaryDTO.self)
    }
    
}
