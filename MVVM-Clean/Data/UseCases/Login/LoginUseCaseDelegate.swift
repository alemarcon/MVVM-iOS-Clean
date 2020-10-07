//
//  LoginUseCaseDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol LoginUseCaseDelegate {
    
    var responseDelegate: LoginUseCaseResponseDelegate? { get set }
    var loginRepository: LoginRepositoryDelegate? { get set }
    
    /// Method that execute code for start login
    /// - Parameters:
    ///   - username: Username string
    ///   - password: Password string
    func startLogin(username: String, password: String)
}
