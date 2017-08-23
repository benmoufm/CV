//
//  ImageRounded.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

    func rounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
