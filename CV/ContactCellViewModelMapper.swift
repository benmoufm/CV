//
//  ContactCellViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 01/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

struct ContactCellViewModelMapper {

    let image: UIImage
    let label: String
    let textColor: UIColor
    let url: URL?
    let shouldCreateContactOnSelect: Bool
    let shouldSendMailOnSelect: Bool

    func map() -> ContactCellViewModel {
        return ContactCellViewModel(
            image: image,
            label: label,
            textColor: textColor,
            url: url,
            shouldCreateContactOnSelect: shouldCreateContactOnSelect,
            shouldSendMailOnSelect: shouldSendMailOnSelect
        )
    }
}
