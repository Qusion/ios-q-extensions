//
//  UIImage+.swift
//  QExtensions
//
//  Created by Tomas Holicky on 21/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// Fix image orientation to up
    func upOrientationImage() -> UIImage? {
        switch imageOrientation {
        case .up:
            return self
        default:
            UIGraphicsBeginImageContextWithOptions(size, false, scale)
            draw(in: CGRect(origin: .zero, size: size))
            let result = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return result
        }
    }
    
    func qrCode(string: String) -> UIImage? {
        let data = string.data(using: .isoLatin1, allowLossyConversion: false)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            filter.setValue("H", forKey: "inputCorrectionLevel")
            
            if let outputImage = filter.outputImage {
                let scaleX = size.width / outputImage.extent.size.width
                let scaleY = size.height / outputImage.extent.size.height
                
                let transformedImage = outputImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
                
                return UIImage(ciImage: transformedImage)
            }
        }
        
        return nil
    }
}
