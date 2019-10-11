//
//  ViewControllerStyleable.swift
//  QExtensions
//
//  Created by Tomas Holicky on 26/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit

public protocol ViewControllerStyleable {
    
    func setStyle()
    func setDefaultAttributesFor(style: QBase.AppStyle, for viewController: UIViewController)
    func setDefaultAttributesFor(style: QBase.AppStyle, for viewController: UIViewController, title: String?, position: UIView.ContentMode)
}

public extension ViewControllerStyleable {
    
    func setDefaultAttributesFor(style: QBase.AppStyle, for viewController: UIViewController) {
        if let navigationBar = viewController.navigationController?.navigationBar {
            style.apply(to: navigationBar)
        }
        
        viewController.view.backgroundColor = style.backgroundColor
    }
    
    func setDefaultAttributesFor(style: QBase.AppStyle, for viewController: UIViewController, title: String?, position: UIView.ContentMode = .center) {
        self.setDefaultAttributesFor(style: style, for: viewController)
        
        if let title = title {
            let titleLabel = UILabel()
            let attributes = style.attributesForStyle(QBase.AppStyle.TextStyle.navigationBar)
            titleLabel.font = attributes.font
            titleLabel.textColor = attributes.color
            titleLabel.backgroundColor = style.backgroundColor
            titleLabel.text = title
            
            switch position {
            case .left:
                viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
            case .right:
                viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: titleLabel)
            case .center:
                viewController.navigationItem.titleView = titleLabel
            default:
                viewController.navigationItem.titleView = titleLabel
            }
        }
    }
}
