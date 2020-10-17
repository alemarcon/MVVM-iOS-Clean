//
//  SessionRepositoryDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol ProfileRepositoryDelegate {
    
    var profileLocalData: ProfileLocalProtocolData? { get set }
    
    /// Save user data
    /// - Parameter user: Current user model object
    func saveCurrentUserData(user: UserModel, success: @escaping (Bool) -> Void, failure: @escaping (CustomError) -> Void)
    
    /// Delete data of current user
    func deleteCurrentUserData(success: @escaping (Bool) -> Void, failure: @escaping (CustomError) -> Void)
    
    /// Retrive current user data
    func getCurrentUserData(success: @escaping (UserModel) -> Void, failure: @escaping (CustomError) -> Void)
    
    func isUserSignedIn(success: @escaping (Bool) -> Void, failure: @escaping (CustomError) -> Void)
    
}
