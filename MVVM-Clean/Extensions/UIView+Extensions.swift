//
//  UIView+Extensions.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import UIKit

extension UIView {
    
    func getSubviews<T: UIView>(type: T.Type) -> [T] {
        var result: [T] = []
        for subview in subviews {
            result += subview.getSubviews(type: type) as [T]
            if let subview = subview as? T {
                result.append(subview)
            }
        }
        return result
    }
    
    func setVerticalGradient(colorTop: CGColor, colorBottom: CGColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at:0)
    }
    
    @discardableResult static func fromNib<T: UIView>() -> T? {
        guard let view = Bundle.main.loadNibNamed(String(describing: T.self), owner: self, options: nil)?.first as? T else { return nil }
        return view
    }
    
}
