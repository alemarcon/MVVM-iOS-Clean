//
//  LogoutUseCaseDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol ProfileUseCaseDelegate {
    
    var responseDelegate: ProfileUseCaseResponseDelegate? { get set }
    var profileRepository: ProfileRepositoryDelegate? { get set }
    
    /// Execute logout
    func logout()
    
    /// Get current user data from local repository
    func getCurrentUserData()
}
