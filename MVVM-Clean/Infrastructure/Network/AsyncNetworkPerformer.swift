//
//  AsyncNetworkPerformer.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 31/03/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation

class AsyncNetworkPerformer {
    
    public static func sendRequest<T: Decodable>(route: APIConfigurationSwift, responseModel: T.Type) async -> Result<T, CustomError> {
        guard let url = URL(string: route.baseURL + route.path) else {
            return .failure(.generic)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = route.method.rawValue
        request.allHTTPHeaderFields = route.header

        if let body = route.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.nilData)
            }
            
            if( response.statusCode >= 200 || response.statusCode <= 299 ) {
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.nilData)
                }
                return .success(decodedResponse)
            } else {
                return .failure(CustomError(errorCode: response.statusCode))
            }
        } catch let error {
            let code = URLError.Code(rawValue: (error as NSError).code)
            switch code {
            case .notConnectedToInternet:
                return .failure(.noConnection)
            default:
                return .failure(.unknow(code: "\(code.rawValue)"))
            }
        }
    }

}
