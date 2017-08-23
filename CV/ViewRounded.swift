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
        layer.cornerRadius = min(frame.width, frame.height) / 2
        clipsToBounds = true
    }
}
