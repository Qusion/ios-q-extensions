//
//  UILabel+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 13/02/2020.
//  Copyright © 2020 Qusion. All rights reserved.
//

import UIKit

extension UILabel {
    
    public func setParagraph(lineSpacing: CGFloat, alignment: NSTextAlignment) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.alignment = alignment
        let attrString = NSMutableAttributedString(string: self.text ?? "")
        attrString.addAttribute(.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        self.attributedText = attrString
    }
}
