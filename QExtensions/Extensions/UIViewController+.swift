//
//  UIViewController+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 30/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public func popToViewControllerType<T>(type: T.Type, completion: ((Bool) -> Void)? = nil) {
        guard let navigationController = self.navigationController else {
            completion?(false)
            return
        }
        
        for controller in navigationController.viewControllers as Array where controller is T {
            _ = self.navigationController?.popToViewController(controller as UIViewController, animated: true)
            completion?(true)
            return
        }
        
        completion?(false)
    }
    
    public func addChildViewControllerWithView(_ childViewController: UIViewController, toView view: UIView? = nil) {
        let view: UIView = view ?? self.view
        
        childViewController.removeFromParent()
        childViewController.willMove(toParent: self)
        addChild(childViewController)
        childViewController.didMove(toParent: self)
        view.addSubview(childViewController.view)
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
    
    public func removeChildViewController(_ childViewController: UIViewController) {
        childViewController.removeFromParent()
        childViewController.willMove(toParent: nil)
        childViewController.removeFromParent()
        childViewController.didMove(toParent: nil)
        childViewController.view.removeFromSuperview()
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
    
    public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc public func dismissKeyboard() {
        view.endEditing(true)
    }
}
