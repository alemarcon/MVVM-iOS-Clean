//
//  LoginRepository.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol LoginRepositoryDelegate {
    
    var profileProtocol: ProfilePersistenceProtocolData? { get set }
    
    /// Execute login request and get
    /// - Parameters:
    ///   - username: The username string
    ///   - password: The password string
    ///   - success: success event of login
    ///   - failure: failure event of login
    func login(username: String, password: String, success: @escaping (User)->Void, failure: @escaping (CustomError)->Void)
}
