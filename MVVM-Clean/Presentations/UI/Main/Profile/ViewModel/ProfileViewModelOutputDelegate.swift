//
//  ProfileViewModelOutputDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 17/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Combine

protocol ProfileViewModelOutputDelegate {
    var status: CurrentValueSubject<ProfileViewModelStatus, Never> { get set }
    var error: CustomError? { get set }
    var currentUser: User? { get set }
}
