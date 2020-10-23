//
//  Covid19UseCaseResponseDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol SummaryUseCaseResponseDelegate: AnyObject {
    
    /// Called on success received summary data
    /// - Parameter summary: Summary data model
    func onSummaryDataReceived(summary: Summary)
    
    /// Called on summary data failure event
    /// - Parameter error: CustomError object
    func onSummaryDataFailure(error: CustomError)
}
