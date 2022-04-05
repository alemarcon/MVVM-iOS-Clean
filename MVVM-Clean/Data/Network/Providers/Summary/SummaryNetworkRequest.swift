//
//  Covid19NetworkRequest.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class SummaryNetworkReqeust: SummaryNetworkProtocolRequest {
    
    func getSummaryData<T>(success: @escaping (T) -> Void, failure: @escaping ((CustomError) -> Void)) where T : Decodable {
        let covidRouter = SummaryRouter.getSummaryData
        _ = NetworkRequestPerfomer.performRequest(route: covidRouter, success: success, failure: failure)
    }
}

//MARK: - Async
class SummaryNetworkAsyncReqeust: SummaryNetworkProtocolAsyncRequest {
    
    func getSummaryData() async throws -> SummaryDTO {
        let covidAsyncRouter = SummaryRouterSwift.getSummaryData
        return try await AsyncNetworkPerformer.sendRequest(route: covidAsyncRouter, responseDTO: SummaryDTO.self)
    }
    
}
