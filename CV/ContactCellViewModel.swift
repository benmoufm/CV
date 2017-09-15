//
//  ContactCellViewModel.swift
//  CV
//
//  Created by Mélodie Benmouffek on 01/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

enum CellType {
    case phone(url: URL?)
    case mail
    case linkedin(url: URL?)
    case contact(isSelected: Bool)
}

struct ContactCellViewModel {

    let image: UIImage
    let label: String
    let textColor: UIColor
    let cellType: CellType
}
