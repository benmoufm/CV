//
//  Animation
//  CV
//
//  Created by Mélodie Benmouffek on 02/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    func deflate() {

        let deflate = CABasicAnimation(keyPath: "transform.scale")
        deflate.duration = 1.0
        deflate.fromValue = 1.0
        deflate.toValue = 0.5
        deflate.fillMode = kCAFillModeForwards
        deflate.isRemovedOnCompletion = false

        layer.add(deflate, forKey: "deflate")
    }

    func inflate() {
        let inflate = CABasicAnimation(keyPath: "transform.scale")
        inflate.duration = 1.0
        inflate.fromValue = 0.5
        inflate.toValue = 1.0
        inflate.fillMode = kCAFillModeForwards
        inflate.isRemovedOnCompletion = false

        layer.add(inflate, forKey: "inflate")
    }

    func translate(distance: CGFloat) {

        let translate = CABasicAnimation(keyPath: "position")
        translate.duration = 1.0
        translate.fromValue = NSValue(cgPoint: CGPoint(x: center.x, y: center.y))
        translate.toValue = NSValue(cgPoint: CGPoint(x: center.x + distance, y: center.y))
        translate.fillMode = kCAFillModeForwards
        translate.isRemovedOnCompletion = false

        layer.add(translate, forKey: "translate")
    }

    func translateBack() {
        let reverseTranslate = CABasicAnimation(keyPath: "position")
        reverseTranslate.duration = 1.0
        reverseTranslate.fromValue = layer.presentation()?.position
        reverseTranslate.toValue = NSValue(cgPoint: CGPoint(x: center.x, y: center.y))
        reverseTranslate.fillMode = kCAFillModeForwards
        reverseTranslate.isRemovedOnCompletion = false

        layer.add(reverseTranslate, forKey: "translate")
    }
}
