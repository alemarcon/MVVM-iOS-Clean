//
//  Covid19RepositoryDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol SummaryRepositoryDelegate {
    
    //MARK: - Data object
    var covidNetwork: SummaryNetworkProtocolRequest? { get set }
    var summaryLocal: SummaryPersistenceProtocolRequest? { get set }
    var countryLocal: CountryPersistenceProtocolRequest? { get set }
    
    //MARK: - Mapper objects
    var summaryMapper: SummaryModelMapperDelegate? { get set }
    var countryMapper: CountryModelMapperDelegate? { get set }
    
    //MARK: - Test variable
    var isRunningFromTest: Bool? { get set }
    
    //MARK: - Methods
    
    /// Get COVID19 summary data. Implementation could get data or from HTTP network call, or if present, from local data.
    /// - Parameters:
    ///   - success: Success event
    ///   - failure: Failure event
    func getSummaryData(success: @escaping (SummaryModel)->Void, failure: @escaping (CustomError)->Void)
}
