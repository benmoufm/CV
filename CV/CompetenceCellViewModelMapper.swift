//
//  CompetenceCellViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 16/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct CompetenceCellViewModelMapper {

    let name: String
    let isTitleCell: Bool
    let category: String
    let evaluation: Int
    let description: String

    func map() -> CompetenceCellViewModel {
        return CompetenceCellViewModel(name: name,
                                       isTitleCell: isTitleCell,
                                       category: category,
                                       evaluation: evaluation,
                                       description: description)
    }
}
