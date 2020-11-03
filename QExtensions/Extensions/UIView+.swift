//
//  UIView+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 21/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Sets `contentHuggingPriority` and `contentCompressionResistancePriority` to `UILayoutPriority.required`.
    public func forceIntrinsic() {
        setContentHuggingPriority(.required, for: .horizontal)
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    public func dropShadow(color: UIColor, opacity: Float = 0.9, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    public func removeAllSubviews() {
        subviews.forEach({ $0.removeFromSuperview() })
    }
}
