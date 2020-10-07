//
//  Covid19Router.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Alamofire

enum SummaryRouter: APIConfiguration {
    
    case getSummaryData
    
    var method: HTTPMethod {
        switch self {
        case .getSummaryData:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getSummaryData:
            return "/summary"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getSummaryData:
            return nil
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
