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
    let skills: [Skill]

    func map() -> CompetenceCellViewModel {
        return CompetenceCellViewModel(name: name,
                                       skills: skills)
    }
}
