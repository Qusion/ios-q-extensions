//
//  Date+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 20/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import Foundation

extension Date {
    
    public var yesterday: Date? {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)
    }
    
    public func someDaysAgo(days: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: -days, to: self)
    }
    
    public var withoutSeconds: Date? {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: self)
        return calendar.date(from: dateComponents)
    }
    
    public func baseFormatDate() -> String {
        let dateFormatter = DateFormatter.baseFormat
        let formattedDate = dateFormatter.string(from: self)
        return formattedDate
    }
    
    public func startDateFormatDate() -> String {
        let dateFormatter = DateFormatter.startDateFormat
        let formattedDate = dateFormatter.string(from: self)
        return formattedDate
    }
    
    public func endDateFormatDate() -> String {
        let dateFormatter = DateFormatter.endDateFormat
        let formattedDate = dateFormatter.string(from: self)
        return formattedDate
    }
    
    public func withoutTimeFormatDate() -> String {
        let dateFormatter = DateFormatter.withoutTimeFormat
        let formattedDate = dateFormatter.string(from: self)
        return formattedDate
    }
    
    public func czechWithoutTimeFormatDate() -> String {
        let dateFormatter = DateFormatter.czechWithoutTimeFormat
        let formattedDate = dateFormatter.string(from: self)
        return formattedDate
    }
}



