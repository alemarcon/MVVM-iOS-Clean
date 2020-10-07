//
//  LogoutViewModelInputDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol SummaryCovidViewModelInputDelegate {
    
    var summaryUseCase: SummaryUseCaseDelegate? { get }
    
    /// Get COVID 19 summary data
    func summaryData()
    
}
