//
//  LoginViewModel.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Bond

enum LoginViewModelStatus {
    case none
    case loginInProgress
    case loginSuccess
    case loginError
}

protocol LoginViewModelDelegate: LoginViewModelInputDelegate, LoginViewModelOutputDelegate { }

class LoginViewModel: LoginViewModelDelegate {

    var error: CustomError?
    var loginUseCase: LoginUseCaseDelegate?
    var status: Observable<LoginViewModelStatus> = Observable(.none)
    
    func executeLogin(username: String, password: String) {
        print("Execute login")
        status.value = .loginInProgress
        error = nil
        loginUseCase?.responseDelegate = self
        loginUseCase?.startLogin(username: username, password: password)
    }
    
}

// MARK: - Login Use Case Response Delegate
extension LoginViewModel: LoginUseCaseResponseDelegate {
    
    func onLoginSuccess(user: UserModel) {
        status.value = .loginSuccess
    }
    
    func onLoginFailure(error: CustomError) {
        self.error = error
        status.value = .loginError
    }
}
