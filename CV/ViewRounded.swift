//
//  ImageRounded.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    func rounded() {
        var radius: CGFloat
        if self.frame.width < self.frame.height {
            radius = self.frame.width / 2
        } else {
            radius = self.frame.height / 2
        }
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
