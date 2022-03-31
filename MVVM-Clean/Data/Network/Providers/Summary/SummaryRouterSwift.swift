//
//  SummaryRouterSwift.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 31/03/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation

enum SummaryRouterSwift: APIConfigurationSwift {
    
    case getSummaryData
    
    var path: String {
        switch self {
        case .getSummaryData:
            return "/summary"
        }
    }
    
    var method: HTTPMethodSwift {
        switch self {
        case .getSummaryData:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .getSummaryData:
            return [HTTPHeaderField.acceptType.rawValue: ContentType.json.rawValue]
        }
    }
    
    var parameters: ParameterSwift? {
        switch self {
        case .getSummaryData:
            return nil
        }
    }
    
}
