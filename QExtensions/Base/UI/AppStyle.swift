//
//  AppStyle.swift
//  QExtensions
//
//  Created by Tomas Holicky on 26/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import Foundation
import UIKit

extension QBase {
    
    /// QBase struct for common style of app
    public struct AppStyle {
        
        /// Type of text styles
        public enum TextStyle {
            case navigationBar
            case tabBar
        }
        
        public struct TextAttributes {
            let font: UIFont
            let color: UIColor
            let backgroundColor: UIColor?
            let selectedColor: UIColor?
            
            public init(font: UIFont? = UIFont.systemFont(ofSize: 13), color: UIColor, selectedColor: UIColor? = .white, backgroundColor: UIColor? = nil) {
                self.font = font ?? UIFont.systemFont(ofSize: 13)
                self.color = color
                self.backgroundColor = backgroundColor
                self.selectedColor = selectedColor
            }
        }
        
        let backgroundColor: UIColor
        let preferredStatusBarStyle: UIStatusBarStyle
        let isHiddenNavigationBottomLine: Bool
        let attributesForStyle: (_ style: TextStyle) -> TextAttributes
        
        public init(backgroundColor: UIColor, preferredStatusBarStyle: UIStatusBarStyle = .default, attributesForStyle: @escaping (_ style: TextStyle) -> TextAttributes, isHiddenNavigationBottomLine: Bool = true) {
            self.backgroundColor = backgroundColor
            self.preferredStatusBarStyle = preferredStatusBarStyle
            self.attributesForStyle = attributesForStyle
            self.isHiddenNavigationBottomLine = isHiddenNavigationBottomLine
        }
        
        // MARK: NavigationBar
        
        public func apply(textStyle: AppStyle.TextStyle = .navigationBar, to navigationBar: UINavigationBar) {
            let attributes = attributesForStyle(textStyle)
            navigationBar.titleTextAttributes = [
                NSAttributedString.Key.font: attributes.font,
                NSAttributedString.Key.foregroundColor: attributes.color
            ]
            
            // Used for barButtonItems
            navigationBar.tintColor = attributes.color
            
            // Used for background color
            navigationBar.barStyle = preferredStatusBarStyle == .default ? .default : .black
            navigationBar.barTintColor = attributes.backgroundColor
            navigationBar.backgroundColor = attributes.backgroundColor
            
            navigationBar.isTranslucent = false
            
            navigationBar.shadowImage = isHiddenNavigationBottomLine ? UIImage() : nil
        }
        
        // MARK: TabBar
        
        public func apply(textStyle: AppStyle.TextStyle, to tabBar: UITabBar) {
            
            let attributes = attributesForStyle(textStyle)
            tabBar.barTintColor = attributes.backgroundColor
            tabBar.tintColor = attributes.color
        }
    }
}
