//
//  HTTPMethodSwift.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 31/03/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation

public struct HTTPMethodSwift: RawRepresentable, Equatable, Hashable {
    /// `CONNECT` method.
    public static let connect = HTTPMethodSwift(rawValue: "CONNECT")
    /// `DELETE` method.
    public static let delete = HTTPMethodSwift(rawValue: "DELETE")
    /// `GET` method.
    public static let get = HTTPMethodSwift(rawValue: "GET")
    /// `HEAD` method.
    public static let head = HTTPMethodSwift(rawValue: "HEAD")
    /// `OPTIONS` method.
    public static let options = HTTPMethodSwift(rawValue: "OPTIONS")
    /// `PATCH` method.
    public static let patch = HTTPMethodSwift(rawValue: "PATCH")
    /// `POST` method.
    public static let post = HTTPMethodSwift(rawValue: "POST")
    /// `PUT` method.
    public static let put = HTTPMethodSwift(rawValue: "PUT")
    /// `TRACE` method.
    public static let trace = HTTPMethodSwift(rawValue: "TRACE")

    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
