//
//  ExperienceDetailControllerViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 30/01/2018.
//Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct ExperienceDetailControllerViewModelMapper {
    let experience: Experience
    let skills: [Skill]

    func map() -> ExperienceDetailControllerViewModel {
        return ExperienceDetailControllerViewModel(
            title: experience.name,
            date: experience.timeStamp,
            skills: ExperienceDetailCollectionViewModelMapper(skills: skills).map(),
            description: experience.description
        )
    }

}
