//
//  UIView+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 21/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit

public extension UIView {
    
    /// Sets `contentHuggingPriority` and `contentCompressionResistancePriority` to `UILayoutPriority.required`.
    func forceIntrinsic() {
        setContentHuggingPriority(.required, for: .horizontal)
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .vertical)
    }
}
