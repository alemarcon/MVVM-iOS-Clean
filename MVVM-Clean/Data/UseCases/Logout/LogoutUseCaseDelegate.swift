//
//  LogoutUseCaseDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol LogoutUseCaseDelegate {
    
    var responseDelegate: LogoutUseCaseResponseDelegate? { get set }
    var logoutRepository: LogoutRepositoryDelegate? { get set }
    
    /// Execute logout
    func logout()
}
