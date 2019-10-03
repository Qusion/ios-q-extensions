//
//  DateFormatter+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 20/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    public static var baseFormat: DateFormatter {
        get {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateformatter.locale = Locale.current
            
            return dateformatter
        }
    }
    
    public static var startDateFormat: DateFormatter {
        get {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy-MM-dd 00:00:00"
            dateformatter.locale = Locale.current
            
            return dateformatter
        }
    }
    
    public static var endDateFormat: DateFormatter {
        get {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy-MM-dd 23:59:59"
            dateformatter.locale = Locale.current
            
            return dateformatter
        }
    }
    
    public static var withoutTimeFormat: DateFormatter {
        get {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy-MM-dd"
            dateformatter.locale = Locale.current
            
            return dateformatter
        }
    }
    
    public static var czechWithoutTimeFormat: DateFormatter {
        get {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "d.M.yyyy"
            dateformatter.locale = Locale.current
            
            return dateformatter
        }
    }
}

