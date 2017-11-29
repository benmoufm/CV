//
//  CompetenceTableViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 16/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct CompetenceTableViewModelMapper {

    let skillCategories: [SkillCategory]

    func map() -> CompetenceTableViewModel {
        return CompetenceTableViewModel(tableCells: [])
    }
}
