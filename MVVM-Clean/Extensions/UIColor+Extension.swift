//
//  UIColor+Extension.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 08/02/22.
//  Copyright © 2022 Alessandro Marcon. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(hex:Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
    
    public convenience init(hexString: String) {
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }else {
            var rgbValue: UInt64 = 0
            Scanner(string: cString).scanHexInt64(&rgbValue)
            self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: 1.0)
        }
    }
    
    convenience init(hexString : String, customAlpha: CGFloat)
    {
        let fixedString = hexString.replacingOccurrences(of: "#", with: "")
        if let rgbValue = UInt(fixedString, radix: 16) {
            let red   =  CGFloat((rgbValue >> 16) & 0xff) / 255
            let green =  CGFloat((rgbValue >>  8) & 0xff) / 255
            let blue  =  CGFloat((rgbValue      ) & 0xff) / 255
            self.init(red: red, green: green, blue: blue, alpha: customAlpha)
        } else {
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }
    }
    
    
    // Color from https://flatuicolors.com/palette/gb
    struct Custom {
        //MARK: - Buttons color
        static let primary = UIColor(hex: 0x192A56)
        static let primaryButton = UIColor(hex: 0x0097E6)
        static let primaryText = UIColor(hex: 0xDCDDE1)
        static let secondary = UIColor(hex: 0x273C75)
        static let secondaryText = UIColor(hex: 0xE1B12C)
        static let textfieldBackground = UIColor(hex: 0xDCDDE1)
    }
}
