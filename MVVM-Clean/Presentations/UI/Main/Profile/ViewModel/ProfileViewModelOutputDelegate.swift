//
//  ProfileViewModelOutputDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 17/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Bond

protocol ProfileViewModelOutputDelegate {
    var status: Observable<ProfileViewModelStatus> { get set }
    var error: CustomError? { get set }
    var currentUser: UserModel? { get set }
}
