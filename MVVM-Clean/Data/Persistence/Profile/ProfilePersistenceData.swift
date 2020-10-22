//
//  ProfilePersistenceData.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 17/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

/**
 This is the implementation of ProfileLocalProtocolData. For simplicity, we use UserDefaults instead of a real datatabase.
 Here, we are going to implement the methods that will be used to locally save and retrieve user data.
 */
class ProfilePersistenceData: ProfilePersistenceProtocolData {
    
    func getLocalUserData() -> UserModel? {
        LOGD("Getting local user data")
        var currentUser: UserModel?
        
        if let currentUsername = UserDefaults.standard.string(forKey: "current_user_username") {
            currentUser = UserModel()
            currentUser!.username = currentUsername
        }
        
        return currentUser
    }
    
    func saveLocalUserData(currentUser: UserModel) {
        LOGD("Saving local user data")
        UserDefaults.standard.set(currentUser.username, forKey: "current_user_username")
    }
    
    func deleteLocalUserData() {
        LOGD("Deleting local user data")
        UserDefaults.standard.removeObject(forKey: "current_user_username")
    }
}
