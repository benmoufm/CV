//
//  StringLocalized.swift
//  CV
//
//  Created by Mélodie Benmouffek on 21/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

extension String {

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

}
