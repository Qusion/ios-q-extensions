//
//  Logger.swift
//  QExtensions
//
//  Created by Tomas Holicky on 20/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import Foundation
import os.log

extension QBase {
    
    public struct LoggerCategory {
        /// Generic app logging category
        public static var app: String { return "App" }
        /// Networking logging category
        public static var networking: String { return "Networking" }
        /// Lifecycle logging category
        public static var lifecycle: String { return "Lifecycle" }
        /// Database logging category
        public static var database: String { return "Database" }
        /// Push notifications logging category
        public static var pushNotifications: String { return "Push Notifications" }
    }
    
    @available(iOS 10.0, *)
    public struct Logger {
        /// Create OSLog with subsystem and category
        public static func osLog(subsystem: String = Bundle.main.bundleIdentifier ?? "-", category: String) -> OSLog {
            return OSLog(subsystem: subsystem, category: category)
        }
        
        /// Create app log
        public static func appLog() -> OSLog {
            return OSLog(subsystem: Bundle.main.bundleIdentifier ?? "-", category: LoggerCategory.app)
        }
        
        /// Create networking log
        public static func networkingLog() -> OSLog {
            return OSLog(subsystem: Bundle.main.bundleIdentifier ?? "-", category: LoggerCategory.networking)
        }
        
        /// Create lifecycle log
        public static func lifecycleLog() -> OSLog {
            return OSLog(subsystem: Bundle.main.bundleIdentifier ?? "-", category: LoggerCategory.lifecycle)
        }
        
        /// Create database log
        public static func databaseLog() -> OSLog {
            return OSLog(subsystem: Bundle.main.bundleIdentifier ?? "-", category: LoggerCategory.database)
        }
        
        /// Create push notifications log
        public static func pushNotificationsLog() -> OSLog {
            return OSLog(subsystem: Bundle.main.bundleIdentifier ?? "-", category: LoggerCategory.pushNotifications)
        }
    }
}
