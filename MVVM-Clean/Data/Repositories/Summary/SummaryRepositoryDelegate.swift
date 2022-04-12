//
//  Covid19RepositoryDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol SummaryRepositoryAsyncDelegate {
    
    //MARK: - Data object
    var covidNetwork: SummaryNetworkProtocolAsyncRequest? { get }
    var summaryLocal: SummaryPersistenceProtocolRequest? { get }
    var countryLocal: CountryPersistenceProtocolRequest? { get }
    
    //MARK: - Test variable
    var isRunningFromTest: Bool? { get set }
    
    //MARK: - Methods
    /// Get COVID19 summary data. Implementation could get data or from HTTP network call, or if present, from local data.
    /// - Returns: <#description#>
    func getSummaryData() async throws -> Summary
}
