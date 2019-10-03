//
//  UIAlertController+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 20/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    class func alert(_ title: String? = nil, message: String? = nil) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    @discardableResult public func action(_ action: String, style: UIAlertAction.Style = .default, onSelected: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        self.addAction(UIAlertAction(title: action, style: style, handler: onSelected))
        return self
    }
    
    @discardableResult public func actionDefault(_ action: String, onDefault: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        self.addAction(UIAlertAction(title: action, style: .default, handler: { alert in
            onDefault?(alert)
        }))
        return self
    }
    
    @discardableResult public func actionCancel(_ action: String, onCancel: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        self.addAction(UIAlertAction(title: action, style: .cancel, handler: { alert in
            onCancel?(alert)
        }))
        return self
    }
    
    @discardableResult public func actionDestructive(_ action: String, onDestruct: @escaping ((UIAlertAction) -> Void)) -> UIAlertController {
        self.addAction(UIAlertAction(title: action, style: .destructive, handler: { action in
            onDestruct(action)
        }))
        return self
    }
}
