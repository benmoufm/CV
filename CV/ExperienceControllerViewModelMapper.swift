//
//  ExperienceControllerViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 16/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct ExperienceControllerViewModelMapper {
    let experienceCategories: [ExperienceCategory]

    func map() -> ExperienceControllerViewModel {
        let experienceTableViewModelMapper = ExperienceTableViewModelMapper(experienceCategories: experienceCategories)
        return ExperienceControllerViewModel(tableView: experienceTableViewModelMapper.map())
    }

}
