//
//  UIStoryboad+Extensions.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import UIKit

extension UIStoryboard {

    enum Storyboard: String {
        case Splash
        case Auth
        case Main
    }
    
    convenience init(_ storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
    
}
