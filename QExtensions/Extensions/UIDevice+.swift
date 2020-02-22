//
//  UIDevice+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 21/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit
import LocalAuthentication

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
    
    /// Has device notch
    public var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
    
    /// Get device biometry type
    public class func deviceBiometryType() -> BiometryType {
        let laContext = LAContext()
        var error: NSError?
        
        if laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            if laContext.biometryType == .faceID {
                return .faceID
            } else if laContext.biometryType == .touchID {
                return .touchID
            }
        }
        
        return .none
    }
    
    public enum BiometryType {
        case none
        case touchID
        case faceID
    }
    
    /// Returns true if biometry is active
    public class func biometryActive() -> Bool {
        var error: NSError?
        
        let result = LAContext().canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error )
        
        return result && error == nil
    }
}
