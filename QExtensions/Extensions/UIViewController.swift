//
//  UIViewController.swift
//  QExtensions
//
//  Created by Tomas Holicky on 25/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import Foundation

extension UIViewController {
    
    func popToViewControllerType<T>(type: T.Type, completion: @escaping (Bool) -> Void) {
        guard let navigationController = self.navigationController else {
            completion(false)
            return
        }
        
        for controller in navigationController.viewControllers as Array where controller is T {
            _ = self.navigationController?.popToViewController(controller as UIViewController, animated: true)
            completion(true)
            return
        }
        
        completion(false)
    }
}
