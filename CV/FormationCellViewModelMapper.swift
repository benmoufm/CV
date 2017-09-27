//
//  FormationCellViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 15/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

struct FormationCellViewModelMapper {
    let image: UIImage

    func map() -> FormationCellViewModel {
        return FormationCellViewModel(image: image)
    }
}
