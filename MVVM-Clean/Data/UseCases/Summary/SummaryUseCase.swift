//
//  Covid19UseCase.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class SummaryUseCase: SummaryUseCaseDelegate {
    
    var responseDelegate: SummaryUseCaseResponseDelegate?
    var summaryRepository: SummaryRepositoryDelegate?
    
    /// Using covid19 repository call summary data and get response with delegate
    func getSummaryData() {
        summaryRepository?.getSummaryData(success: { (summaryModel) in
            self.responseDelegate?.onSummaryDataReceived(summary: summaryModel)
        }, failure: { (error) in
            self.responseDelegate?.onSummaryDataFailure(error: error)
        })
    }
    
}
