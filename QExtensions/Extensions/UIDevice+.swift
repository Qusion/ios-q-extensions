//
//  UIDevice+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 21/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit

extension UIDevice {
    
    /// Returns true if is iPad
    public var isPad: Bool {
        return userInterfaceIdiom == .pad
    }
    
    /// Get device UUID
    public var deviceUUID: String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
    /// Get device name
    public var deviceName: String {
        return UIDevice.current.name
    }
}
