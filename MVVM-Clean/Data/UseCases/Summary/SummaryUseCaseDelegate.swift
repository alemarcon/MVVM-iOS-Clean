//
//  Covid19UseCaseDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol SummaryUseCaseAsyncDelegate {
    
    //MARK: - Protocol properties
    var summaryRepository: SummaryRepositoryAsyncDelegate? { get set }
    
    /// Get summary data
    /// - Returns: Return Summary object
    func getAsyncSummaryData() async throws -> Summary
}
