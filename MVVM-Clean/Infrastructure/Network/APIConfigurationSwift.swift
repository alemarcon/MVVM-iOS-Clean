//
//  APIConfigurationSwift.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 31/03/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation

public typealias ParameterSwift = [String: Any]

protocol APIConfigurationSwift {
    
    var path: String { get }
    var method: HTTPMethodSwift { get }
    var header: [String: String]? { get }
    var parameters: ParameterSwift? { get }
    
    /// Transform APIConfigurationSwift protocol to an URLRequest object
    /// - Returns: <#description#>
    func asURLRequest() throws -> URLRequest
}

extension APIConfigurationSwift {
    func asURLRequest() throws -> URLRequest {
        var urlRequest: URLRequest?
        
        let url = API.baseURL
        let pathWithEncoding = path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        // Parameters
        if let parameters = parameters {
            switch method {
            case .post:
                do {
                    urlRequest = URLRequest(url: URL(string: "\(url)\(pathWithEncoding)")!)
                    urlRequest!.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                } catch(let error) {
                    throw error
                }
            case .get:
                var urlComponents = URLComponents(string: "\(url)\(pathWithEncoding)")!
                
                for param in parameters {
                    urlComponents.queryItems?.append( URLQueryItem(name: param.key, value: "\(param.value)") )
                }
                urlRequest = URLRequest(url: urlComponents.url!)
            default:
                throw CustomError.generic
            }
        }
        
        guard var request = urlRequest else {
            throw CustomError.nilData
        }
        
        // HTTP Method
        request.httpMethod = method.rawValue
        
        // Common Headers
        if let headers = self.header {
            for h in headers {
                request.addValue(h.value, forHTTPHeaderField: h.key)
            }
        }
        
        return request
    }
}
