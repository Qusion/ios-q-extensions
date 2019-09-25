//
//  UIButton+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 20/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit

typealias UIButtonHelper = UIButton

extension UIButton {
    
    public func set(image: UIImage, attributedTitle: NSAttributedString, titlePosition: UIView.ContentMode, additionalSpacing: CGFloat, state: UIControl.State){
        imageView?.contentMode = .center
        setImage(image, for: state)
        
        positionLabelRespectToImage(image: image, attributedTitle: attributedTitle, position: titlePosition, spacing: additionalSpacing)
        
        titleLabel?.contentMode = .center
        setAttributedTitle(attributedTitle, for: state)
    }
    
    public func set(image: UIImage, title: String, titlePosition: UIView.ContentMode, additionalSpacing: CGFloat, state: UIControl.State){
        imageView?.contentMode = .center
        setImage(image, for: state)
        
        positionLabelRespectToImage(image: image, title: title, position: titlePosition, spacing: additionalSpacing)
        
        titleLabel?.contentMode = .center
        setTitle(title, for: state)
    }
}

extension UIButtonHelper {
    
    private func positionLabelRespectToImage(image: UIImage, attributedTitle: NSAttributedString, position: UIView.ContentMode, spacing: CGFloat) {
        let imageRect: CGSize = image.size
        let titleSize = attributedTitle.size()
        
        arrange(titleSize: titleSize, imageSize: imageRect, atPosition: position, withSpacing: spacing)
    }
    
    private func positionLabelRespectToImage(image: UIImage, title: String, position: UIView.ContentMode, spacing: CGFloat) {
        let imageSize = image.size
        
        let titleFont: UIFont = titleLabel?.font ?? UIFont()
        let titleSize: CGSize = title.size(withAttributes: [NSAttributedString.Key.font: titleFont])
        
        arrange(titleSize: titleSize, imageSize: imageSize, atPosition: position, withSpacing: spacing)
    }
    
    private func arrange(titleSize: CGSize, imageSize: CGSize, atPosition position: UIView.ContentMode, withSpacing spacing: CGFloat) {
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position) {
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing), left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing), left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        titleEdgeInsets = titleInsets
        imageEdgeInsets = imageInsets
    }
}

