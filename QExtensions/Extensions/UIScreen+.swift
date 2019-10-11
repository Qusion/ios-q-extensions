//
//  UIScreen+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 11/10/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import Foundation

extension UIScreen {
    
    public class func isSmallDevice() -> Bool {
        if UIScreen.main.bounds.size.height <= 568 {
            return true
        } else {
            return false
        }
    }
    
    public class func isMiddleDevice() -> Bool {
        if UIScreen.main.bounds.size.height <= 667 {
            return true
        } else {
            return false
        }
    }
}
