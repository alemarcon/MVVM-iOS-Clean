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
    
    /// Get local user data. If there is no data, nil will be returned.
    func getLocalUserData() -> UserModel?
    
    /// Save current user data locally.
    /// - Parameter currentUser: The current UserModel data to save
    func saveLocalUserData(currentUser: UserModel)
    
    /// Delete local user data
    func deleteLocalUserData()
    
    
}
