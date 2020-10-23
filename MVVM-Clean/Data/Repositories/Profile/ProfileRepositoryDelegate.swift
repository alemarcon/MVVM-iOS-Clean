//
//  SessionRepositoryDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol ProfileRepositoryDelegate {
    
    var profileLocalData: ProfilePersistenceProtocolData? { get set }

    /// Save user data
    /// - Parameters:
    ///   - user: Current user model object
    ///   - success: Event fired in success case
    ///   - failure: Event fired in failure case
    func saveCurrentUserData(user: User, success: @escaping (Bool) -> Void, failure: @escaping (CustomError) -> Void)
    
    /// Delete data of current user
    /// - Parameters:
    ///   - success: Event fired in success case
    ///   - failure: Event fired in failure case
    func deleteCurrentUserData(success: @escaping (Bool) -> Void, failure: @escaping (CustomError) -> Void)
    
    /// Retrive current user data
    /// - Parameters:
    ///   - success: Event fired in success case
    ///   - failure: Event fired in failure case
    func getCurrentUserData(success: @escaping (User) -> Void, failure: @escaping (CustomError) -> Void)
    
    /// Check if users is signed in
    /// - Parameters:
    ///   - success: Event fired in success case
    ///   - failure: Event fired in failure case
    func isUserSignedIn(success: @escaping (Bool) -> Void, failure: @escaping (CustomError) -> Void)
    
}
