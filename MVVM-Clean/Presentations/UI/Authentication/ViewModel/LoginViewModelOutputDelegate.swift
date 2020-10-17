//
//  LoginViewModelOutputDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Bond

protocol LoginViewModelOutputDelegate {
    var status: Observable<LoginViewModelStatus> { get }
    var error: CustomError? { get }
}
