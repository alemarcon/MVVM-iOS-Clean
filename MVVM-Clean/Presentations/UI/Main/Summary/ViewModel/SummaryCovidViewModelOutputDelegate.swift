//
//  LogoutViewModelOutputDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Bond

protocol SummaryCovidViewModelOutputDelegate {
    var status: Observable<SummaryCovidViewModelStatus> { get }
    var error: CustomError? { get }
    var summary: Summary? { get set }
}
