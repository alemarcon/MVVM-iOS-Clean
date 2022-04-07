//
//  Covid19UseCase.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class SummaryAsyncUseCase: SummaryUseCaseAsyncDelegate {
    
    var summaryRepository: SummaryRepositoryAsyncDelegate?
    
    func getAsyncSummaryData() async throws -> Summary {
        guard let summary = try await summaryRepository?.getSummaryData() else {
            throw CustomError.nilData
        }
        return summary
    }
    
}
