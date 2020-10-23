//
//  SplashScreenViewModel.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Bond

enum SplashScreenViewModelStatus {
    case none
    case loggedIn
    case notLoggedIn
}

protocol SplashScreenViewModelDelegate: SplashScreenViewModelInputDelegate, SplashScreenViewModelOutputDelegate { }

class SplashScreenViewModel: SplashScreenViewModelDelegate {
        
    var profileUseCase: ProfileUseCaseDelegate?
    var status: Observable<SplashScreenViewModelStatus> = Observable(.none)
    
    func checkUserState() {
        profileUseCase?.getCurrentUserData()
    }
}

extension SplashScreenViewModel: ProfileUseCaseResponseDelegate {
    
    func gettingUserDataSuccess(currentUser: User) {
        self.status.value = .loggedIn
    }
    
    func gettingUserDataFailure(error: CustomError) {
        self.status.value = .notLoggedIn
    }
    
    
}
