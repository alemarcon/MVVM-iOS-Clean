//
//  CustomTypealias.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 16/02/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import Foundation

typealias FailureCompletion = (CustomError) -> Void
typealias SuccessCompletion<T> = (T) -> Void
