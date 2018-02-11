//
//  StarViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 11/02/2018.
//Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

struct StarViewModelMapper {

    let fillingRatio: CGFloat

    func map() -> StarViewModel {
        return StarViewModel(fillingRatio: fillingRatio)
    }
}
