//
//  String+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 20/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit

extension String {
    
    /// Returns first letter of self
    public var firstLetter: String? {
        guard count > 0 else { return nil }
        return self.first.flatMap { String($0) }
    }
    
    /// Returns true if string contains just numeric characters
    public var isNumeric: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    /// Uses self as key to Localizable.strings and returns it's localized value or self
    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    /// Normalizes string - removes interpuction etc.
    public func normalized() -> String {
        let mutableString = NSMutableString(string: self) as CFMutableString
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        CFStringTransform(mutableString, nil, kCFStringTransformStripCombiningMarks, false)
        CFStringLowercase(mutableString, Locale.current as CFLocale)
        return mutableString as String
    }
    
    /// Returns date by given DateFormatter
    public func date(dateFormat: DateFormatter) -> Date? {
        guard let date = dateFormat.date(from: self) else { return nil }
        return date
    }
    
    /// Returns **true** if `self` matches `regex`
    public func matchesRegex(_ regex: String) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: self)
    }
    
    /// Check if `self` is valid email with default regex
    public func isValidEmail(regex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}") -> Bool {
        return matchesRegex(regex)
    }
    
    /// Check if `self` is valid phone number with default regex
    public func isValidPhoneNumber(regex: String = "^((\\+|00)(420|421))? ?\\d{3} ?\\d{3} ?\\d{3}$") -> Bool {
        return matchesRegex(regex)
    }
    
    /// Check if `self` is valid password with default regex
    public func isValidPassword(regex: String = "(?=^.{8,}$)(?=.*\\d)(?=.*[a-zA-Z]).*$") -> Bool {
        return matchesRegex(regex)
    }
    
    /// Removes diacritics from string using given locale
    public func removingDiacritics(_ locale: Locale = Locale.current) -> String {
        return folding(options: .diacriticInsensitive, locale: locale)
    }
    
    /// Creates qr code image with given size
    public func createQRCode(size: CGSize) -> UIImage? {
        let data = self.data(using: .isoLatin1, allowLossyConversion: false)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            filter.setValue("H", forKey: "inputCorrectionLevel")
            
            if let outputImage = filter.outputImage {
                let scaleX = size.width / outputImage.extent.size.width
                let scaleY = size.height / outputImage.extent.size.height
                
                let transformedImage = outputImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
                
                return UIImage(ciImage: transformedImage)
            }
        }
        
        return nil
    }
}

