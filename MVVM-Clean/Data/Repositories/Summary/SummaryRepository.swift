//
//  Covid19Repository.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class SummaryRepositoryAsync: SummaryRepositoryAsyncDelegate {
    
    var covidNetwork: SummaryNetworkProtocolAsyncRequest?
    var summaryLocal: SummaryPersistenceProtocolRequest?
    var countryLocal: CountryPersistenceProtocolRequest?
    var isRunningFromTest: Bool?
    
    func getSummaryData() async throws -> Summary {
        var needDataFromNetwork = true
        
        let localSummaryDTO = summaryLocal?.getLocalSummaryDataDTO()
        
        if( localSummaryDTO != nil ) {
            LOGD("Local summary data found!")
            needDataFromNetwork = CustomDateUtils.checkForNetworkUpdate(lastUpdate: localSummaryDTO!.date ?? "")
        }
        // This is a flag that force collecting data from network if a unit test is running.
        // In case of test, data are collected on a JSON file and not really on network
        if let _isRunningFromTest = isRunningFromTest {
            needDataFromNetwork = _isRunningFromTest
        }
        
        if( needDataFromNetwork ) {
            
            guard let summary = try await covidNetwork?.getSummaryData() else {
                throw CustomError.nilData
            }
            
            summaryLocal?.saveLocalSummaryDTO(data: summary)
            if let countries = summary.countries {
                self.countryLocal?.saveLocalCountryDataDTO(data: countries)
            }
            
            return SummaryDTOMapper.map(summary: summary)
        } else {
            
            guard let localData = localSummaryDTO else {
                throw CustomError.nilData
            }
            
            let summaryModel = SummaryDTOMapper.map(summary: localData)
            LOGD("Success sent with localData")
            return summaryModel

        }
    }
    
}
