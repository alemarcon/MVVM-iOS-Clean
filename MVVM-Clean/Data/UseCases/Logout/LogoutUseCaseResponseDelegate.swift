//
//  LogoutUseCaseResponseDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol LogoutUseCaseResponseDelegate: AnyObject {
    
    /// Event called on successful logout operation
    func onLogoutSuccess()
    
    /// Event called on error logout operation
    /// - Parameter error: The error occurred
    func onLogoutFailure(error: CustomError)
    
}
