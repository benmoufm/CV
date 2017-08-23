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

    func cropToSquare() -> UIImage {

        let imageSize: CGSize = self.size
        var rectCoordinate = CGPoint()
        var rectSize = CGSize()

        // Calculate dimensions for the square
        if imageSize.width < imageSize.height {
            let yCoordinate = (imageSize.height - imageSize.width) / 2.0
            rectCoordinate = CGPoint(x: 0.0, y: yCoordinate)
            rectSize = CGSize(width: imageSize.width, height: imageSize.width)
        } else {
            let xCoordinate = (imageSize.width - imageSize.height) / 2.0
            rectCoordinate = CGPoint(x: xCoordinate, y: 0.0)
            rectSize = CGSize(width: imageSize.height, height: imageSize.height)
        }

        // Draw square
        let rect: CGRect = CGRect(x: rectCoordinate.x, y: rectCoordinate.y, width: rectSize.width, height: rectSize.height)
        // Draw picture in square
        let imageRef: CGImage = self.cgImage!.cropping(to: rect)!
        let croppedImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)

        return croppedImage
    }

}
