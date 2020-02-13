//
//  UITableViewCell+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 13/02/2020.
//  Copyright © 2020 Qusion. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    public func setSelectedColor(color: UIColor?) {
        if let color = color {
            let selectedView = UIView()
            selectedView.backgroundColor = color
            self.selectedBackgroundView = selectedView
        } else {
            self.selectionStyle = .none
            self.selectedBackgroundView = nil
        }
    }
}
