//
//  Covid19UseCaseDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol SummaryUseCaseDelegate {
    
    //MARK: - Protocol properties
    var responseDelegate: SummaryUseCaseResponseDelegate? { get set }
    var summaryRepository: SummaryRepositoryDelegate? { get set }
    
    /// Get summary data
    func getSummaryData()
    
}
