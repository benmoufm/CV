//
//  ExperienceCellViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

struct ExperienceCellViewModelMapper {
    let icon: UIImage
    let label: String

    func map() -> ExperienceCellViewModel {
        return ExperienceCellViewModel(icon: icon, label: label)
    }
}
