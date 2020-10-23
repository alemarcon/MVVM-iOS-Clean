//
//  ProfileViewModel.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 17/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Bond

//MARK: - ProfileViewModel Status
enum ProfileViewModelStatus {
    case none
    // Logout state
    case loggeoutProcessBegin
    case logoutProcessSuccess
    case logoutProcessFailure
    // Getting user data state
    case gettingUserData
    case gettingUserDataSuccess
    case gettingUserDataFailure
}

protocol ProfileViewModelDelegate: ProfileViewModelInputDelegate, ProfileViewModelOutputDelegate { }

class ProfileViewModel: ProfileViewModelDelegate {
    var currentUser: User?
    var profileUseCase: ProfileUseCaseDelegate?
    var status: Observable<ProfileViewModelStatus> = Observable(.none)
    var error: CustomError?
    
    func logoutUser() {
        LOGI("User is going to be logged out")
        status.value = .loggeoutProcessBegin
        profileUseCase?.logout()
    }
    
    func getUserData() {
        LOGP("Getting user data status")
        status.value = .gettingUserData
        profileUseCase?.getCurrentUserData()
    }
    
}

extension ProfileViewModel: ProfileUseCaseResponseDelegate {
    
    //MARK: - Logout response
    func onLogoutSuccess() {
        currentUser = nil
        status.value = .logoutProcessSuccess
    }
    
    func onLogoutFailure(error: CustomError) {
        self.error = error
        self.status.value = .logoutProcessFailure
    }
    
    //MARK: - Userdata response
    func gettingUserDataSuccess(currentUser: User) {
        self.currentUser = currentUser
        status.value = .gettingUserDataSuccess
    }
    
    func gettingUserDataFailure(error: CustomError) {
        self.error = error
        status.value = .gettingUserDataFailure
    }
}
