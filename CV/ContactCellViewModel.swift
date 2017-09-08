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
    case phone
    case mail
    case linkedin
    case contact
}

struct ContactCellViewModel {

    let image: UIImage
    let label: String
    let textColor: UIColor
    let url: URL?
    let cellType: CellType
}
