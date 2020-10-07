//
//  SummaryLocalProtocolRequest.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

/// Protocol
protocol SummaryLocalProtocolRequest {
    
    /// <#Description#>
    func getLocalSummaryData() -> SummaryModel?
    
    /// <#Description#>
    /// - Parameter data: <#data description#>
    func saveLocalSummary(data: SummaryModel)
}
