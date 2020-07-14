//
//  AnimatedButton.swift
//  QExtensions
//
//  Created by Tomas Holicky on 26/03/2020.
//  Copyright © 2020 Qusion. All rights reserved.
//

import UIKit

extension QBase {
    
    open class AnimatedButton: UIButton {
        
        override open var isHighlighted: Bool {
            didSet {
                let transform: CGAffineTransform = isHighlighted ? .init(scaleX: 0.93, y: 0.93) : .identity
                animate(transform)
            }
        }
    }
}

private extension QBase.AnimatedButton {
    
    private func animate(_ transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3, options: [.curveEaseInOut], animations: {
            self.transform = transform
        })
    }
}
