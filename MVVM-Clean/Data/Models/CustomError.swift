//
//  CustomError.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

enum CustomError: Error {
    case noContent
    case unknow(code: String)
    case nilData
    case unauthorized
    case badRequest
    case notFound
    case forbidden
    case userNotFound
    case logoutError
    case loginError
    case generic
    
    init(errorCode: Int) {
        switch errorCode {
        case NetworkStatusCode.noContent.rawValue:
            self = .noContent
        case NetworkStatusCode.unauthorized.rawValue:
            self = .unauthorized
        case NetworkStatusCode.badRequest.rawValue:
            self = .badRequest
        case NetworkStatusCode.notFound.rawValue:
            self = .notFound
        case NetworkStatusCode.forbidden.rawValue:
            self = .forbidden
        default:
            self = .generic
        }
    }
}

extension CustomError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noContent:
            return NSLocalizedString(Localized.no_content_found.rawValue, comment: "")
        case .unknow(let code):
            let genericErrorMessage = NSLocalizedString(Localized.generic_localized_net_error_message.rawValue, comment: "")
            let genericErrorMessageWithFormat = String.localizedStringWithFormat(genericErrorMessage, "\(code)")
            return genericErrorMessageWithFormat
        case .nilData:
            return NSLocalizedString(Localized.nil_data_msg.rawValue, comment: "")
        case .unauthorized:
            return NSLocalizedString(Localized.unauthorized_message.rawValue, comment: "")
        case .badRequest:
            return NSLocalizedString(Localized.badRequest_message.rawValue, comment: "")
        case .notFound:
            return NSLocalizedString(Localized.not_found_message.rawValue, comment: "")
        case .forbidden:
            return NSLocalizedString(Localized.forbidden_message.rawValue, comment: "")
        case .userNotFound:
            return NSLocalizedString(Localized.user_not_found_message.rawValue, comment: "")
        case .logoutError:
            return NSLocalizedString(Localized.logout_error_message.rawValue, comment: "")
        case .loginError:
            return NSLocalizedString(Localized.login_error_message.rawValue, comment: "")
        case .generic:
            return NSLocalizedString(Localized.generic_error_message.rawValue, comment: "")
        }
    }
}
