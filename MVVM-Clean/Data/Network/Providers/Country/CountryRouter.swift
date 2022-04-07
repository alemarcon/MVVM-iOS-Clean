//
//  CountryRouter.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 06/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Alamofire

/**
 This router is not used inside the demo project but was implemented just to show how to use methods that required
 parameters. This is the logic, and the correct way to implement methods that required parameters.
 WARNING: I've not tested this HTTP call so, it could be doesn't work
 */
enum CountryRouter: APIConfiguration {
    
    case getByCountryByStatus(countrySlug: String, status: Covid19Status, from: String, to: String)
    
    var method: HTTPMethod {
        switch self {
        case .getByCountryByStatus:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getByCountryByStatus(let countrySlug, let status, _, _):
            return "/country/\(countrySlug)/status\(status)"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getByCountryByStatus(_, _, let from, let to):
            return ["from":from, "to":to]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = API.baseURL
        
        let pathWithEncoding = path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        var urlRequest = URLRequest(url: URL(string: "\(url)\(pathWithEncoding)")!)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
    
}


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
