//
//  ExperienceTableViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct ExperienceTableViewModelMapper {
    let experienceCategories: [ExperienceCategory]

    func map() -> ExperienceTableViewModel {
        let experiencesCellViewModel = experienceCategories.map { item -> ExperienceCellViewModel in
            return ExperienceCellViewModelMapper(name: item.name,
                                                 experiences: item.experiences).map()
        }

        return ExperienceTableViewModel(tableCells: experiencesCellViewModel)
    }
}
