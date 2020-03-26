//
//  CustomLoadingView.swift
//  QExtensions
//
//  Created by Tomas Holicky on 20/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit
import QuartzCore

extension QBase {
    
    open class CustomLoadingView: UIView {
        
        var image: UIImage? {
            didSet {
                setImage(image: image!)
            }
        }
        
        // MARK: - Variables
        
        var isAnimating = false
        
        // MARK: - Init
        
        func setImage(image: UIImage) {
            self.layer.contents = image.cgImage
            self.layer.masksToBounds = true
            
            addRotation(forLayer: self.layer)
            pause(layer: self.layer)
        }
        
        // MARK: - Private
        
        fileprivate func addRotation(forLayer layer: CALayer) {
            let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
            
            rotation.duration = 1.0
            rotation.isRemovedOnCompletion = false
            rotation.repeatCount = HUGE
            rotation.fillMode = CAMediaTimingFillMode.forwards
            rotation.fromValue = NSNumber(value: 0.0)
            rotation.toValue = NSNumber(value: 3.14 * 2.0)
            
            layer.add(rotation, forKey: "rotate")
        }
        
        fileprivate func pause(layer: CALayer) {
            let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
            
            layer.speed = 0.0
            layer.timeOffset = pausedTime
            
            isAnimating = false
        }
        
        fileprivate func resume(layer: CALayer) {
            let pausedTime = layer.timeOffset
            
            layer.speed = 1.0
            layer.timeOffset = 0.0
            layer.beginTime = 0.0
            
            let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
            layer.beginTime = timeSincePause
            
            isAnimating = true
        }
        
        // MARK: - public func
        
        public func startAnimating () {
            
            if isAnimating {
                return
            }
            
            resume(layer: self.layer)
        }
        
        public func stopAnimating () {
            pause(layer: self.layer)
        }
    }
}
