//
//  LoginUseCaseResponseDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol LoginUseCaseResponseDelegate: AnyObject {
    
    /// Event fired on login process successed
    /// - Parameter user: The UserModel object corresponding to current user logged in
    func onLoginSuccess(user: UserModel)
    
    /// Event fired in case of login failed.
    /// - Parameter error: The error object
    func onLoginFailure(error: CustomError)
    
}
