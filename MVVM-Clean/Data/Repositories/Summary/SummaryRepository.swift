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
    var summaryLocal: SummaryLocalProtocolRequest?
    var countryLocal: CountryLocalProtocolRequest?
    var summaryMapper: SummaryModelMapperDelegate?
    var countryMapper: CountryModelMapperDelegate?
    
    var isRunningFromTest: Bool?
    
    func getSummaryData(success: @escaping (SummaryModel) -> Void, failure: @escaping (CustomError) -> Void) {
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
            covidNetwork?.getSummaryData( success: { (response: Summary ) in
                LOGI("Data received")
                
                self.summaryLocal?.saveLocalSummaryDTO(data: response)
                
                if let summmary = self.summaryMapper?.mapToSummaryModel(summary: response) {
                    if let countries = response.countries {
                        self.countryLocal?.saveLocalCountryDataDTO(data: countries)
                    }
                    
                    success(summmary)
                } else {
                    LOGE("Summary model mapper is nil")
                    let customError = CustomError()
                    customError.errorMessage = "SummayModelMapper is nil"
                    customError.localizedErrorMessage = NSLocalizedString("summary_mapper_error", comment: "")
                    failure(customError)
                }
            }, failure: { (error: CustomError) in
                LOGE("Error occurred. \(error.localizedErrorMessage)")
                failure(error)
            })
        } else {
            if let localData = localSummaryDTO, let summaryModel = self.summaryMapper?.mapToSummaryModel(summary: localData) {
                LOGD("Success sent with localData")
                success(summaryModel)
            }
        }
    }
    
}
