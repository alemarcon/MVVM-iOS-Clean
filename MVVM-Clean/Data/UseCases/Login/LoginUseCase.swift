//
//  LoginUseCase.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class LoginUseCase: NSObject, LoginUseCaseDelegate {
    
    var loginRepository: LoginRepositoryDelegate?
    var responseDelegate: LoginUseCaseResponseDelegate?
    
    func startLogin(username: String, password: String) {
        print("Start login")
        loginRepository?.login(username: username, password: password, success: { (userModel) in
            self.responseDelegate?.onLoginSuccess(user: userModel)
        }, failure: { (error) in
            self.responseDelegate?.onLoginFailure(error: error)
        })
    }
}
