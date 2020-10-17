//
//  ProfileViewModelInputDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 17/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol ProfileViewModelInputDelegate {
    
    var profileUseCase: ProfileUseCaseDelegate? { get }
    
    /// Get current user data
    func getUserData()
    
    /// Logout user from app
    func logoutUser()
    
}
