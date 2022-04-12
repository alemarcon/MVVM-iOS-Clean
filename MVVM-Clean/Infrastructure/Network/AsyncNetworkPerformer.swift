//
//  AsyncNetworkPerformer.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 31/03/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation

class AsyncNetworkPerformer {
    
    /// Send HTTP request using asyncronous function
    /// - Returns: Decodable generics object
    public static func sendRequest<T: Decodable>(route: APIConfigurationSwift, responseDTO: T.Type) async throws -> T {
        do {
            let (data, response) = try await URLSession.shared.data(for: route.asURLRequest())
            guard let response = response as? HTTPURLResponse else {
                throw CustomError.nilData
            }
            
            if( response.statusCode >= 200 || response.statusCode <= 299 ) {
                guard let decodedResponse = try? JSONDecoder().decode(responseDTO, from: data) else {
                    throw CustomError.jsonDecodeError
                }
                return decodedResponse
            } else {
                throw CustomError(errorCode: response.statusCode)
            }
        } catch let error {
            let code = URLError.Code(rawValue: (error as NSError).code)
            switch code {
            case .notConnectedToInternet:
                throw CustomError.noConnection
            default:
                throw CustomError.unknow(code: "\(error.localizedDescription)")
            }
        }
    }

}
