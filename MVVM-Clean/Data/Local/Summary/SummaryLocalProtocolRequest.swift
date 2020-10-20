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
    
    /// Save summary data in local storage.
    /// - Parameter data: Summary dto data to save locally
    func saveLocalSummaryDTO(data: Summary)
    
    /// Get Summary data from locale storage. If there is no data, nil will be returned
    func getLocalSummaryDataDTO() -> Summary?
}
