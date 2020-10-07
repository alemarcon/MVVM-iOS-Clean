//
//  Covid19NetworkProtocolRequest.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Alamofire

/// Protocol
protocol SummaryNetworkProtocolRequest {
    
    /// Collect summary data from COVID19 API
    /// - Parameters:
    ///   - success: <#success description#>
    ///   - failure: <#failure description#>
    func getSummaryData<T: Decodable>(success: @escaping (T) -> Void, failure: @escaping ((CustomError) -> Void))
}
