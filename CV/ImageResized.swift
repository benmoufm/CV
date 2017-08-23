//
//  ImageCropped.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {

    func scaleToScreen(ratio: CGFloat) -> UIImage {
        let imageWidth = self.size.width
        let imageHeight = self.size.height
        let hasAlpha = false
        var size = CGSize()
        var scaledImage = UIImage()
        // Get the shorter between width and height (case portrait/landscape)
        if self.size.width < self.size.height {
            // Calculate the size of the image
            size.width = UIScreen.main.bounds.width / ratio
            size.height = size.width * imageHeight / imageWidth
        } else {
            // Calculate the size of the image
            size.height = UIScreen.main.bounds.width / ratio
            size.width = size.height * imageWidth / imageHeight
        }

        // Draw in new size
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        self.draw(in: CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: size))

        scaledImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return scaledImage
    }

}
