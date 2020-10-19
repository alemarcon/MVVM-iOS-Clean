//
//  APIConfiguration.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 30/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Alamofire
/**
 This is the base protocol used to configure all API router object
 */
protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
