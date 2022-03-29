//
//  LoginRepository.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class LoginRepository: LoginRepositoryDelegate {
    
    var profileProtocol: ProfilePersistenceProtocolData?
    
    private let USERNAME = "admin"
    private let PASSWORD = "pass123!"

    func login(username: String, password: String, success: @escaping (User) -> Void, failure: @escaping (CustomError) -> Void) {
        // Move here your network request instead of this code
        if( username == USERNAME && password == PASSWORD ) {
            var userModel = User()
            userModel.username = USERNAME
            profileProtocol?.saveLocalUserData(currentUser: userModel)
            
            success(userModel)
        } else {
            failure(CustomError.loginError)
        }
    }
}
