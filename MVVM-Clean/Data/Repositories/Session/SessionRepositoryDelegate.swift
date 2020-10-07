//
//  SessionRepositoryDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol SessionRepositoryDelegate {
    
    var isUserSignedIn: Bool? { get set }
    
    var currentUsername: String? { get set }
    
    func logout()
}
