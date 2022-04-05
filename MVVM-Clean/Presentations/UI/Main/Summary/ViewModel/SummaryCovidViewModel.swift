//
//  LogoutViewModel.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Combine

//MARK: - SummaryCovidViewModel Status
enum SummaryCovidViewModelStatus {
    case none
    case gettingSummaryData
    case summaryDataSuccess
    case summaryDataError
}

protocol SummaryCovidViewModelDelegate: SummaryCovidViewModelInputDelegate, SummaryCovidViewModelOutputDelegate { }

class SummaryCovidViewModel: SummaryCovidViewModelDelegate {

    internal var summaryUseCaseAsync: SummaryUseCaseDelegateAsync?
    var status: CurrentValueSubject<SummaryCovidViewModelStatus, Never> = .init(.none)
    var summary: Summary?
    var error: CustomError?
    
    func summaryDataAsync() {
        LOGI("Begin recover summary data async")
        status.send(.gettingSummaryData)
        Task {
            guard let data = try await summaryUseCaseAsync?.getAsyncSummaryData() else {
                status.send(.summaryDataError)
                return
            }
            self.summary = data
            status.send(.summaryDataSuccess)
        }
    }
}
