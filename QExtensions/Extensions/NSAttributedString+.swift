//
//  NSAttributedString+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 20/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import Foundation

public extension NSAttributedString {
    
    /// Append another attributed string
    func byAppending(_ other: NSAttributedString) -> NSAttributedString {
        let result = NSMutableAttributedString()
        
        result.append(self)
        result.append(other)
        
        return result
    }
    
    /// Concat two attributed strings
    static func +(_ lhs: NSAttributedString, _ rhs: NSAttributedString) -> NSAttributedString {
        return lhs.byAppending(rhs)
    }
}
