//
//  LogoutUseCase.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class ProfileUseCase: NSObject, ProfileUseCaseDelegate {
    
    var responseDelegate: ProfileUseCaseResponseDelegate?
    var profileRepository: ProfileRepositoryDelegate?
    
    /// Implementation of logout function
    func logout() {
        print("Execute logout")
        
        profileRepository?.deleteCurrentUserData(success: { (success) in
            if( success ) {
                self.responseDelegate?.onLogoutSuccess()
            } else {
                self.responseDelegate?.onLogoutFailure(error: CustomError.logoutError)
            }
        }, failure: { (error) in
            self.responseDelegate?.onLogoutFailure(error: error)
        })
    }
    
    /// Implementation of get user data function
    func getCurrentUserData() {
        profileRepository?.getCurrentUserData(success: { (user) in
            LOGP("User data found")
            self.responseDelegate?.gettingUserDataSuccess(currentUser: user)
        }, failure: { (error) in
            LOGP("User data not found")
            self.responseDelegate?.gettingUserDataFailure(error: error)
        })
    }
    
}
