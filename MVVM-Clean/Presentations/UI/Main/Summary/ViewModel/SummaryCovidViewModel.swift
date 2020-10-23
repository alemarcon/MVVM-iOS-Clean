//
//  LogoutViewModel.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Bond

//MARK: - SummaryCovidViewModel Status
enum SummaryCovidViewModelStatus {
    case none
    case gettingSummaryData
    case summaryDataSuccess
    case summaryDataError
}

protocol SummaryCovidViewModelDelegate: SummaryCovidViewModelInputDelegate, SummaryCovidViewModelOutputDelegate { }

class SummaryCovidViewModel: SummaryCovidViewModelDelegate {
    
    var summaryUseCase: SummaryUseCaseDelegate?
    var status: Observable<SummaryCovidViewModelStatus> = Observable(.none)
    var summary: Summary?
    var error: CustomError?

    func summaryData() {
        LOGI("Begin recover summary data")
        status.value = .gettingSummaryData
        summaryUseCase?.getSummaryData()
    }
    
}

// MARK: - Logout Use Case Response Delegate
extension SummaryCovidViewModel: SummaryUseCaseResponseDelegate {
    
    func onSummaryDataReceived(summary: Summary) {
        LOGI("Summary data received")
        self.summary = summary
        status.value = .summaryDataSuccess
    }
    
    func onSummaryDataFailure(error: CustomError) {
        LOGI("Summary data not received")
        self.summary = nil
        self.error = error
        status.value = .summaryDataError
    }
    
}
