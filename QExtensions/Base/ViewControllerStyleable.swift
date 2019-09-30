//
//  ViewControllerStyleable.swift
//  QExtensions
//
//  Created by Tomas Holicky on 26/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit

extension QBase {
    
}
protocol ViewControllerStyleable {
    
    func setStyle()
    func setDefaultAttributesFor(style: QBase.AppStyle, for viewController: UIViewController)
    func setDefaultAttributesFor(style: QBase.AppStyle, for viewController: UIViewController, title: String?)
}

extension ViewControllerStyleable {
    
    func setDefaultAttributesFor(style: QBase.AppStyle, for viewController: UIViewController) {
        if let navigationBar = viewController.navigationController?.navigationBar {
            style.apply(to: navigationBar)
        }
        
        viewController.view.backgroundColor = style.backgroundColor
    }
    
    func setDefaultAttributesFor(style: QBase.AppStyle, for viewController: UIViewController, title: String?) {
        self.setDefaultAttributesFor(style: style, for: viewController)
        
        if let title = title {
            let titleLabel = UILabel()
            let attributes = style.attributesForStyle(QBase.AppStyle.TextStyle.navigationBar)
            titleLabel.font = attributes.font
            titleLabel.textColor = attributes.color
            titleLabel.backgroundColor = style.backgroundColor
            titleLabel.text = title
            viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: titleLabel)
        }
    }
}
