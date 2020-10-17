//
//  LogoutUseCase.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class SessionUseCase: NSObject, SessionUseCaseDelegate {
    
    var responseDelegate: LogoutUseCaseResponseDelegate?
    var logoutRepository: LogoutRepositoryDelegate?
    
    /// Implementation of logout function
    func logout() {
        print("Execute logout")
        logoutRepository?.logout(success: { (success) in
            self.responseDelegate?.onLogoutSuccess()
        }, failure: { (error) in
            self.responseDelegate?.onLogoutFailure(error: error)
        })
    }
    
}
