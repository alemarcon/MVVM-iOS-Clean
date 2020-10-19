//
//  LogoutUseCaseResponseDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol ProfileUseCaseResponseDelegate: AnyObject {
    
    //MARK: - Logout response delegate
    
    /// Event called on successful logout operation
    func onLogoutSuccess()
    
    /// Event called on error logout operation
    /// - Parameter error: The error occurred
    func onLogoutFailure(error: CustomError)
    
    //MARK: - User data response delegate
    
    /// Event called on success during getting user data operation
    func gettingUserDataSuccess(currentUser: UserModel)
    
    /// Event called on error during getting user data operation
    /// - Parameter error: The error occurred
    func gettingUserDataFailure(error: CustomError)
    
}

/**
 This is the default implementation of ProfileUseCaseResponseDelegate. It avoids having to implement all methods even when not needed.
 */
extension ProfileUseCaseResponseDelegate {
    func onLogoutSuccess() {}
    func onLogoutFailure(error: CustomError) {}
    func gettingUserDataSuccess(currentUser: UserModel) {}
    func gettingUserDataFailure(error: CustomError) {}
}
