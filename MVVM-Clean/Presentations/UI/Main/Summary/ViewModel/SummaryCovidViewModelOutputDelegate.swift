//
//  LogoutViewModelOutputDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Combine

protocol SummaryCovidViewModelOutputDelegate {
    var status: CurrentValueSubject<SummaryCovidViewModelStatus, Never> { get set }
    var error: CustomError? { get }
    var summary: Summary? { get set }
}
