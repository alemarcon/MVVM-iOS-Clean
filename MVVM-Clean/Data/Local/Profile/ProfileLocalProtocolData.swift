//
//  ProfileLocalProtocolRequest.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 17/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

/// Protocol
protocol ProfileLocalProtocolData {
    
    /// <#Description#>
    func getLocalUserData() ->UserModel?
    
    /// <#Description#>
    /// - Parameter currentUser: <#currentUser description#>
    func saveLocalUserData(currentUser: UserModel)
    
    /// Delete local user data
    func deleteLocalUserData()
    
    
}
