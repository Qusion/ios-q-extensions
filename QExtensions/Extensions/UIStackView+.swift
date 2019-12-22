//
//  UIStackView+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 22/12/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit

extension UIStackView {
    
    public func setUp(axis: NSLayoutConstraint.Axis = .horizontal, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0) {
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
    }
}
