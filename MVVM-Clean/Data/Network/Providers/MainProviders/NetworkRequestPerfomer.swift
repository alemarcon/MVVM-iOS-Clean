//
//  NetworkRequestPerfomer.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 30/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Alamofire

class NetworkRequestPerfomer {
    
    /// A generic network request performer for execute all request for router that extends APIConfiguration
    /// - Parameters:
    ///   - route: Router object
    ///   - success: success operation
    ///   - failure: fail operation
    /// - Returns: Current network operation request
//    public static func performRequest<T:Decodable>(route: APIConfiguration, success: @escaping (T) -> Void, failure: @escaping ((CustomError) -> Void)) -> DataRequest {
    public static func performRequest<T:Decodable>(route: APIConfiguration, success: @escaping SuccessCompletion<T>, failure: @escaping FailureCompletion) -> DataRequest {
        return AF.request(route)
            .responseJSON { response in
                do {
                    if response.error != nil {
                        let localizedDesctiptionError: String = response.error?.localizedDescription ?? ""
                        if response.data != nil {
                            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                                print("Data response: \(utf8Text)")
                            }
                        } else {
                            print("Error: \(localizedDesctiptionError)")
                        }
                        if let statusCode = response.response?.statusCode {
                            
                            let customError = CustomError()
                            let genericErrorMessage = NSLocalizedString("welcome_message", comment: "")
                            let genericErrorMessageWithFormat = String.localizedStringWithFormat(genericErrorMessage, "\(statusCode)")
                            
                            customError.errorMessage = genericErrorMessageWithFormat
                            customError.localizedErrorMessage = NSLocalizedString("generic_localized_net_error_message", comment: "")
                            failure(customError)
                        }
                        
                    } else {
                        if let responseData = response.data {
                            LOGI("Data response: \(responseData)")
                            
                            if let jsonArray = try JSONSerialization.jsonObject(with: responseData, options : .allowFragments) as?  [String:Any] {
                                
                                var statusCode: Int? = (jsonArray["statusCode"] as? Int)
                                if (statusCode == nil) {
                                    statusCode = response.response?.statusCode
                                }
                                
                                if let statusCode = statusCode {
                                    
                                    switch statusCode {
                                        
                                    case NetworkStatusCode.success.rawValue:
                                        // 200 network status code reached
                                        success(try JSONDecoder().decode(T.self, from: responseData))
                                        
                                    case NetworkStatusCode.noContent.rawValue:
                                        // Manage 204 code.
                                        LOGE("\(NetworkStatusCode.noContent.rawValue)")
                                        let customError = CustomError()
                                        let genericErrorMessage = NSLocalizedString("generic_net_error_message", comment: "")
                                        let genericErrorMessageWithFormat = String.localizedStringWithFormat(genericErrorMessage, NetworkStatusCode.noContent.rawValue)
                                        
                                        customError.errorMessage = genericErrorMessageWithFormat
                                        customError.localizedErrorMessage = NSLocalizedString("generic_localized_net_error_message", comment: "")
                                        failure(customError)
                                        
                                    case NetworkStatusCode.unauthorized.rawValue:
                                        // Manage 401 erorr code.
                                        LOGE("\(NetworkStatusCode.unauthorized.rawValue)")
                                        let customError = CustomError()
                                        let genericErrorMessage = NSLocalizedString("generic_net_error_message", comment: "")
                                        let genericErrorMessageWithFormat = String.localizedStringWithFormat(genericErrorMessage, NetworkStatusCode.unauthorized.rawValue)
                                        
                                        customError.errorMessage = genericErrorMessageWithFormat
                                        customError.localizedErrorMessage = NSLocalizedString("generic_localized_net_error_message", comment: "")
                                        failure(customError)
                                        
                                    case NetworkStatusCode.badRequest.rawValue:
                                        // Manage 400 erorr code.
                                        let customError = CustomError()
                                        let genericErrorMessage = NSLocalizedString("generic_net_error_message", comment: "")
                                        let genericErrorMessageWithFormat = String.localizedStringWithFormat(genericErrorMessage, NetworkStatusCode.badRequest.rawValue)
                                        
                                        customError.errorMessage = genericErrorMessageWithFormat
                                        customError.localizedErrorMessage = NSLocalizedString("generic_localized_net_error_message", comment: "")
                                        failure(customError)
                                        
                                    case NetworkStatusCode.notFound.rawValue:
                                        // Manage 404 error.
                                        let customError = CustomError()
                                        let genericErrorMessage = NSLocalizedString("generic_net_error_message", comment: "")
                                        let genericErrorMessageWithFormat = String.localizedStringWithFormat(genericErrorMessage, NetworkStatusCode.notFound.rawValue)
                                        
                                        customError.errorMessage = genericErrorMessageWithFormat
                                        customError.localizedErrorMessage = NSLocalizedString("generic_localized_net_error_message", comment: "")
                                        failure(customError)
                                        
                                    case NetworkStatusCode.forbidden.rawValue:
                                        // Manage 403 forbidden error.
                                        LOGE("\(NetworkStatusCode.forbidden.rawValue)")
                                        let customError = CustomError()
                                        let genericErrorMessage = NSLocalizedString("generic_net_error_message", comment: "")
                                        let genericErrorMessageWithFormat = String.localizedStringWithFormat(genericErrorMessage, NetworkStatusCode.forbidden.rawValue)
                                        
                                        customError.errorMessage = genericErrorMessageWithFormat
                                        customError.localizedErrorMessage = NSLocalizedString("generic_localized_net_error_message", comment: "")
                                        failure(customError)
                                        
                                    default:
                                        // Manage unknow erorr code.
                                        failure(getGenericError())
                                    }
                                }
                                else {
                                    failure(getGenericError())
                                }
                            }
                            else {
                                failure(getGenericError())
                            }
                            
                            
                        } else {
                            let error = CustomError()
                            error.errorMessage = NSLocalizedString("nil_data", comment: "")
                            error.localizedErrorMessage = NSLocalizedString("nil_data_msg", comment: "")
                            failure(error)
                        }
                    }
                } catch {
                    let localizedErrorDescription: String = error.localizedDescription
                    LOGE("\(error)")
                    let statusCode = NetworkStatusCode(rawValue: response.response?.statusCode ?? 0) ?? NetworkStatusCode.undefined
                    
                    let error = CustomError()
                    let genericErrorMessage = NSLocalizedString("generic_net_error_message", comment: "")
                    let genericErrorMessageWithFormat = String.localizedStringWithFormat(genericErrorMessage, "\(statusCode)")
                    error.errorMessage = genericErrorMessageWithFormat
                    error.localizedErrorMessage = localizedErrorDescription
                    failure(error)
                }
        }
    }
    
    
    private static func getGenericError() -> CustomError {
        
        let customError = CustomError()
        customError.errorMessage = ""
        customError.localizedErrorMessage = ""
        return customError
    }
    
}

