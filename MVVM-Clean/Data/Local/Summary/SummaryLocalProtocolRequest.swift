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
    
    /// Get summary data from locale storage. If there is no data, nil will be returned
    func getLocalSummaryData() -> SummaryModel?
    
    /// Save summary data in local storage.
    /// - Parameter data: SummaryModel data to save locally
    func saveLocalSummary(data: SummaryModel)
}
