//
//  ViewController.swift
//  QExtensions
//
//  Created by Tomas Holicky on 26/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit
import os.log

extension QBase {
    
    class ViewController<ViewModelType>: UIViewController, ViewControllerStyleable {
        
        // MARK: View Model
        
        var viewModel: ViewModelType!
        
        // MARK: Initializers
        
        override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
            super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        init(viewModel: ViewModelType) {
            super.init(nibName: nil, bundle: nil)
            
            if QBase.isLoggingEnabled {
                if #available(iOS 10.0, *) {
                    os_log(" %@", log: Logger.lifecycleLog(), type: .info, self)
                } else {
                    NSLog("📱 👶 \(self)")
                }
            }
            
            defer {
                self.viewModel = viewModel
            }
        }
        
        deinit {
            if #available(iOS 10.0, *) {
                os_log("📱 ⚰️ %@", log: Logger.lifecycleLog(), type: .info, self)
            } else {
                NSLog("📱 ⚰️ \(self)")
            }
        }
        
        // MARK: Lifecycle
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.setStyle()
        }
        
        // MARK: Bind
        
        func bind() {}
        
        // MARK: Style
        
        func setStyle() {}
        
        // MARK: Actions
        
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    }
}


