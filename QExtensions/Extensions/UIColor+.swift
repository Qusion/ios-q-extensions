//
//  UIColor+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 19/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// Initializers for creating hex color
    public convenience init(hexString: String) {
        
        /// Trim leading '#' if needed
        var cleanedHexString = hexString
        if hexString.hasPrefix("#") {
            cleanedHexString = String(hexString.dropFirst())
        }
        
        /// String -> UInt32
        var rgbValue: UInt32 = 0
        Scanner(string: cleanedHexString).scanHexInt32(&rgbValue)
        
        /// UInt32 -> R,G,B
        let red = CGFloat((rgbValue >> 16) & 0xff) / 255.0
        let green = CGFloat((rgbValue >> 08) & 0xff) / 255.0
        let blue = CGFloat((rgbValue >> 00) & 0xff) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    /// Initializers for creating blend color
    public static func blend(color1: UIColor, intensity1: CGFloat = 0.5, color2: UIColor, intensity2: CGFloat = 0.5) -> UIColor {
        
        let total = intensity1 + intensity2
        let l1 = intensity1/total
        let l2 = intensity2/total
        
        guard l1 > 0 else { return color2 }
        guard l2 > 0 else { return color1 }
        
        var (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        var (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        
        color1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        return UIColor(red: l1*r1 + l2*r2, green: l1*g1 + l2*g2, blue: l1*b1 + l2*b2, alpha: l1*a1 + l2*a2)
    }
}

