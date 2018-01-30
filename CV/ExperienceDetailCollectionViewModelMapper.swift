//
//  ExperienceDetailCollectionViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 30/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct ExperienceDetailCollectionViewModelMapper {
    let skills: [Skill]

    func map() -> ExperienceDetailCollectionViewModel {
        return ExperienceDetailCollectionViewModel(cells:
            skills.map { ExperienceDetailCellViewModelMapper(skill: $0).map() })
    }
}
