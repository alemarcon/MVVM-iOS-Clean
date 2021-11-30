//
//  SplashScreenViewModel.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Combine

enum SplashScreenViewModelStatus {
    case none
    case loggedIn
    case notLoggedIn
}

protocol SplashScreenViewModelDelegate: SplashScreenViewModelInputDelegate, SplashScreenViewModelOutputDelegate { }

class SplashScreenViewModel: SplashScreenViewModelDelegate {
        
    var profileUseCase: ProfileUseCaseDelegate?
    var status: CurrentValueSubject<SplashScreenViewModelStatus, Never> = .init(.none)
    
    func checkUserState() {
        profileUseCase?.getCurrentUserData()
    }
}

extension SplashScreenViewModel: ProfileUseCaseResponseDelegate {
    
    func gettingUserDataSuccess(currentUser: User) {
        status.send(.loggedIn)
    }
    
    func gettingUserDataFailure(error: CustomError) {
        status.send(.notLoggedIn)
    }
    
}
