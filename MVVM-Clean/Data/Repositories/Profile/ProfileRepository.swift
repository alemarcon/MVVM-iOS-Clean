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
    
    func saveCurrentUserData(user: UserModel, success: @escaping (Bool) -> Void, failure: @escaping (CustomError) -> Void) {
        LOGD("Saving current user")
        profileLocalData?.saveLocalUserData(currentUser: user)
        success(true)
    }
    
    func deleteCurrentUserData(success: @escaping (Bool) -> Void, failure: @escaping (CustomError) -> Void) {
        LOGD("Delete current user")
        profileLocalData?.deleteLocalUserData()
        success(true)
    }
    
    func getCurrentUserData(success: @escaping (UserModel) -> Void, failure: @escaping (CustomError) -> Void) {
        LOGD("Get current user")
        if let currentUser = profileLocalData?.getLocalUserData() {
            success(currentUser)
        } else {
            let error = CustomError()
            error.errorMessage = "User not found"
            error.localizedErrorMessage = NSLocalizedString("no_local_user_found", comment: "")
            failure(error)
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
