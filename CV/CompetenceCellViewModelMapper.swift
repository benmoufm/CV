//
//  CompetenceCellViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 16/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct CompetenceCellViewModelMapper {

    let label: String
    let isTitleCell: Bool

    func map() -> CompetenceCellViewModel {
        return CompetenceCellViewModel(label: label, isTitleCell: isTitleCell)
    }
}
