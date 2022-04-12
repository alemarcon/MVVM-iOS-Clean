//
//  CountryRouter.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 06/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

//MARK: - Async
enum CountryRouterSwift: APIConfigurationSwift {
    
    case getByCountryByStatus(countrySlug: String, status: Covid19Status, from: String, to: String)
    
    var path: String {
        switch self {
        case .getByCountryByStatus(let countrySlug, let status, _, _):
            return "/country/\(countrySlug)/status\(status)"
        }
    }
    
    var method: HTTPMethodSwift {
        switch self {
        case .getByCountryByStatus:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .getByCountryByStatus:
            return [HTTPHeaderField.acceptType.rawValue: ContentType.json.rawValue]
        }
    }
    
    var parameters: ParameterSwift? {
        switch self {
        case .getByCountryByStatus(_, _, let from, let to):
            return ["from":from, "to":to]
        }
    }
}
