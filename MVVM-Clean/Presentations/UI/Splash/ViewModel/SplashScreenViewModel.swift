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
        
    var sessionRepository: SessionRepositoryDelegate?
    
    var status: Observable<SplashScreenViewModelStatus> = Observable(.none)
    
    var isUserLoggedIn: Bool {
        get {
            return sessionRepository?.isUserSignedIn ?? false
        }
    }
    
    func checkUserState() {
        if( isUserLoggedIn ) {
            status.value = .loggedIn
        } else {
            status.value = .notLoggedIn
        }
    }
}
