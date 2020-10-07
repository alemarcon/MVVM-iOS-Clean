//
//  BaseResponse.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 30/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

// MARK: - Default response of Rest API
struct BaseResponse<T: Codable>: Codable {
    var statusCode: Int?
    var result: T?
    
    /// Models actually are not defined so could change in future. Could be usefull have key mapping for change the name with less code impact
    enum CodingKeys: String, CodingKey {
        case statusCode
        case result = "data"
    }
    
}
