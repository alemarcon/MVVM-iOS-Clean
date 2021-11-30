//
//  LoginViewModel.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Combine

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
    var status: CurrentValueSubject<LoginViewModelStatus, Never> = .init(.none)
    
    func executeLogin(username: String, password: String) {
        print("Execute login")
        status.send(.loginInProgress)
        error = nil
        loginUseCase?.responseDelegate = self
        loginUseCase?.startLogin(username: username, password: password)
    }
    
}

// MARK: - Login Use Case Response Delegate
extension LoginViewModel: LoginUseCaseResponseDelegate {
    
    func onLoginSuccess(user: User) {
        status.send(.loginSuccess)
    }
    
    func onLoginFailure(error: CustomError) {
        self.error = error
        status.send(.loginError)
    }
}
