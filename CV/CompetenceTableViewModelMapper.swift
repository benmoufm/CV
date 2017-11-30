//
//  CompetenceTableViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 16/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct CompetenceTableViewModelMapper {

    let skills: [Skill]

    init(skills: [Skill]) {
        self.skills = skills
    }

    func map() -> CompetenceTableViewModel {
        // Mapping of skills array
        let result = skills.map { item -> CompetenceCellViewModel in
            return CompetenceCellViewModelMapper(name: item.name,
                                          isTitleCell: item.isCategory,
                                          category: item.category.description,
                                          evaluation: item.evaluation,
                                          description: item.usageDescription).map()
        }

        return CompetenceTableViewModel(tableCells: result)
    }
}
