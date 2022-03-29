//
//  Covid19Repository.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class SummaryRepository: SummaryRepositoryDelegate {
    
    var covidNetwork: SummaryNetworkProtocolRequest?
    var summaryLocal: SummaryPersistenceProtocolRequest?
    var countryLocal: CountryPersistenceProtocolRequest?
    
    var isRunningFromTest: Bool?
    
    func getSummaryData(success: @escaping (Summary) -> Void, failure: @escaping (CustomError) -> Void) {
        var needDataFromNetwork = true
        
        let localSummaryDTO = summaryLocal?.getLocalSummaryDataDTO()
        
        if( localSummaryDTO != nil ) {
            LOGD("Local summary data found!")
            needDataFromNetwork = CustomDateUtils.checkForNetworkUpdate(lastUpdate: localSummaryDTO!.date ?? "")
        }
        // This is a flag that force collecting data from network if a unit test is running.
        // In case of test, data are collected on a JSON file and not really on network
        if let _isRunningFromTest = isRunningFromTest {
            if( _isRunningFromTest ) {
                needDataFromNetwork = true
            }
        }
        
        if( needDataFromNetwork ) {
            LOGD("Local summary data is nil or older than delta, new network update needed")
            covidNetwork?.getSummaryData( success: { (response: SummaryDTO ) in
                LOGI("Data received")
                
                self.summaryLocal?.saveLocalSummaryDTO(data: response)
                let summmary = SummaryDTOMapper.map(summary: response)
                if let countries = response.countries {
                    self.countryLocal?.saveLocalCountryDataDTO(data: countries)
                }
                success(summmary)
                
            }, failure: { (error: CustomError) in
                LOGE("Error occurred. \(error.errorDescription)")
                failure(error)
            })
        } else {
            if let localData = localSummaryDTO {
                let summaryModel = SummaryDTOMapper.map(summary: localData)
                LOGD("Success sent with localData")
                success(summaryModel)
            }
        }
    }
    
}
