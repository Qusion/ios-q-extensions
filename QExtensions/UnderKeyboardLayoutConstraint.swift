//
//  UnderKeyboardLayoutConstraint.swift
//  QExtensions
//
//  Created by Tomas Holicky on 20/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit

public class UnderKeyboardLayoutConstraint: NSObject {
    private weak var bottomLayoutConstraint: NSLayoutConstraint?
    private var keyboardObserver = UnderKeyboardObserver()
    private var initialConstraintConstant: CGFloat = 0
    private var minMargin: CGFloat = 10
    
    private var viewToAnimate: UIView?
    
    public override init() {
        super.init()
        
        keyboardObserver.willAnimateKeyboard = { [weak self] height in
            self?.keyboardWillAnimate(height)
        }
        keyboardObserver.animateKeyboard = { [weak self] height in
            self?.animateKeyboard(height)
        }
        
        keyboardObserver.start()
    }
    
    deinit {
        keyboardObserver.stop()
    }
    
    public func setup(_ bottomLayoutConstraint: NSLayoutConstraint, view: UIView, minMargin: CGFloat = 10) {
        initialConstraintConstant = bottomLayoutConstraint.constant
        self.bottomLayoutConstraint = bottomLayoutConstraint
        self.minMargin = minMargin
        self.viewToAnimate = view
        
        if let currentKeyboardHeight = keyboardObserver.currentKeyboardHeight, currentKeyboardHeight > 0 {
            keyboardWillAnimate(currentKeyboardHeight)
        }
    }
    
    func keyboardWillAnimate(_ height: CGFloat) {
        guard let bottomLayoutConstraint = bottomLayoutConstraint else { return }
        
        if height > 0 {
            let newConstantValue = height + minMargin
            
            if newConstantValue > initialConstraintConstant {
                bottomLayoutConstraint.constant = newConstantValue
            } else {
                bottomLayoutConstraint.constant = initialConstraintConstant
            }
        } else {
            bottomLayoutConstraint.constant = initialConstraintConstant
        }
    }
    
    func animateKeyboard(_ height: CGFloat) {
        guard let viewToAnimate = viewToAnimate else { return }
        
        if viewToAnimate.window != nil {
            viewToAnimate.layoutIfNeeded()
        }
    }
}

public final class UnderKeyboardObserver: NSObject {
    public typealias AnimationCallback = (_ height: CGFloat) -> ()
    
    let notificationCenter: NotificationCenter
    
    public var willAnimateKeyboard: AnimationCallback?
    
    public var animateKeyboard: AnimationCallback?
    
    public var currentKeyboardHeight: CGFloat?
    
    public override init() {
        notificationCenter = NotificationCenter.default
        super.init()
    }
    
    deinit {
        stop()
    }
    
    public func start() {
        stop()
        
        notificationCenter.addObserver(self, selector: #selector(UnderKeyboardObserver.keyboardNotification(_:)), name:UIResponder.keyboardWillShowNotification, object: nil);
        notificationCenter.addObserver(self, selector: #selector(UnderKeyboardObserver.keyboardNotification(_:)), name:UIResponder.keyboardWillHideNotification, object: nil);
    }
    
    public func stop() {
        notificationCenter.removeObserver(self)
    }
    
    @objc func keyboardNotification(_ notification: Notification) {
        let isShowing = notification.name == UIResponder.keyboardWillShowNotification
        
        if let userInfo = (notification as NSNotification).userInfo,
            let height = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height,
            let duration: TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
            let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber {
            
            let correctedHeight = isShowing ? height : 0
            willAnimateKeyboard?(correctedHeight)
            
            UIView.animate(withDuration: duration, delay: TimeInterval(0), options: UIView.AnimationOptions(rawValue: animationCurveRawNSN.uintValue), animations: { [weak self] in
                self?.animateKeyboard?(correctedHeight) }, completion: nil
            )
            
            currentKeyboardHeight = correctedHeight
        }
    }
}

