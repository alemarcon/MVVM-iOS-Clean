//
//  SessionRepository.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class ProfileRepository: ProfileRepositoryDelegate {

    var profileLocalData: ProfilePersistenceProtocolData?
    
    func saveCurrentUserData(user: User, success: @escaping (Bool) -> Void, failure: @escaping (CustomError) -> Void) {
        LOGD("Saving current user")
        profileLocalData?.saveLocalUserData(currentUser: user)
        success(true)
    }
    
    func deleteCurrentUserData(success: @escaping (Bool) -> Void, failure: @escaping (CustomError) -> Void) {
        LOGD("Delete current user")
        profileLocalData?.deleteLocalUserData()
        success(true)
    }
    
    func getCurrentUserData(success: @escaping (User) -> Void, failure: @escaping (CustomError) -> Void) {
        LOGD("Get current user")
        if let currentUser = profileLocalData?.getLocalUserData() {
            success(currentUser)
        } else {
            failure(CustomError.userNotFound)
        }
    }
    
    func isUserSignedIn(success: @escaping (Bool) -> Void, failure: @escaping (CustomError) -> Void) {
        if let _ = profileLocalData?.getLocalUserData() {
            success(true)
        } else {
            success(false)
        }
    }
    
}
