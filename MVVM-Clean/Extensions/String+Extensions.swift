//
//  String+Extensions.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

import UIKit

extension String {
    
    
    /// Check if password is valid
    /// - Parameter minSizePassword: Min number of char for password lenght
    /// - Returns: TRUE is password is valid FALSE otherwise
    func isValidPassword(minSizePassword: Int) -> Bool {
        if( self.count >= minSizePassword ) {
            return true
        } else {
            return false
        }
    }
    
}
