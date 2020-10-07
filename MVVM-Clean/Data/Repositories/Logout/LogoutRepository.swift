//
//  LogoutRepository.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class LogoutRepository: LogoutRepositoryDelegate {
    var sessionRepository: SessionRepositoryDelegate?
    
    func logout(success: @escaping (Bool) -> Void, failure: @escaping (CustomError) -> Void) {
        // Do your network stuff here
        sessionRepository?.currentUsername = nil
        sessionRepository?.isUserSignedIn = false
        success(true)
    }
}
