//
//  GradientView.swift
//  QExtensions
//
//  Created by Tomas Holicky on 20/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit

///This view creates a gradient view with the defined colors
open class GradientView: UIView {
    
    private weak var gradientLayer: CAGradientLayer!
    
    /// Initializers for creating gradient view
    public init(colors: [UIColor], axis: NSLayoutConstraint.Axis) {
        super.init(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        if axis == .vertical {
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        } else {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        
        layer.insertSublayer(gradientLayer, at: 0)
        self.gradientLayer = gradientLayer
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
