//
//  SessionRepository.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class SessionRepository: SessionRepositoryDelegate {

    /// Flag for user signed in. True if user is signed in, False otherwise
    var isUserSignedIn: Bool? {
        get {
            return UserDefaults.standard.bool(forKey: "is_user_signed_in")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "is_user_signed_in")
        }
    }
    
    /// The current name of the logged user
    var currentUsername: String? {
        get {
            return UserDefaults.standard.string(forKey: "current_user_username") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "current_user_username")
        }
    }
    
    /// Function to logout user that delete stored data
    func logout() {
        isUserSignedIn = false
        currentUsername = nil
    }
}
