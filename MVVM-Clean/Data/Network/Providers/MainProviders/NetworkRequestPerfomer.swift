//
//  NetworkRequestPerfomer.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 30/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

//import Foundation
//import Alamofire
//
//
//class NetworkRequestPerfomer {
//
//    /// A generic network request performer for execute all request for router that extends APIConfiguration
//    /// - Parameters:
//    ///   - route: Router object
//    ///   - success: success operation
//    ///   - failure: fail operation
//    /// - Returns: Current network operation request
//    @available(iOS, deprecated, message: "Will be replaced", renamed: "AsyncNetworkPerformer.sendReqeust()")
//    public static func performRequest<T:Decodable>(route: APIConfiguration, success: @escaping (T) -> Void, failure: @escaping ((CustomError) -> Void)) -> DataRequest {
//        return AF.request(route)
//            .responseJSON { response in
//                do {
//                    if response.error != nil {
//                        let localizedDesctiptionError: String = response.error?.localizedDescription ?? ""
//                        if response.data != nil {
//                            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                                print("Data response: \(utf8Text)")
//                            }
//                        } else {
//                            print("Error: \(localizedDesctiptionError)")
//                        }
//                        if let statusCode = response.response?.statusCode {
//                            failure(CustomError.unknow(code: "\(statusCode)"))
//                        }
//
//                    } else {
//                        if let responseData = response.data {
//                            LOGI("Data response: \(responseData)")
//
//                            if let jsonArray = try JSONSerialization.jsonObject(with: responseData, options : .allowFragments) as? [String:Any] {
//
//                                var statusCode: Int? = (jsonArray["statusCode"] as? Int)
//                                if (statusCode == nil) {
//                                    statusCode = response.response?.statusCode
//                                }
//
//                                if( statusCode == NetworkStatusCode.success.rawValue ) {
//                                    success(try JSONDecoder().decode(T.self, from: responseData))
//                                } else {
//                                    failure( CustomError(errorCode: statusCode!))
//                                }
//                            } else {
//                                failure(getGenericError())
//                            }
//                        } else {
//                            failure(CustomError.nilData)
//                        }
//                    }
//                } catch {
//                    failure(CustomError.generic)
//                }
//        }
//    }
//
//
//    private static func getGenericError() -> CustomError {
//        return CustomError.generic
//    }
//
//}
