//
//  UINavigationController+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 22/12/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    public func setClear(isTranslucent: Bool = true) {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = isTranslucent
        self.navigationBar.backgroundColor = .clear
    }
}
