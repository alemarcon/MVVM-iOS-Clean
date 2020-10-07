//
//  LogoutRepositoryDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol LogoutRepositoryDelegate {
    
    var sessionRepository: SessionRepositoryDelegate? { get }
    
    /// Execute logout and clean data from session
    /// - Parameters:
    ///   - success: <#success description#>
    ///   - failure: <#failure description#>
    func logout(success: @escaping (Bool)->Void, failure: @escaping (CustomError)->Void)
}
