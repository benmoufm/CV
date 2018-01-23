//
//  RestExperienceCategoryMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct ExperienceCategoryMapper {
    let restExperienceCategory: RestExperienceCategory

    func map() -> ExperienceCategory {
        return ExperienceCategory(
            id: restExperienceCategory.id,
            name: restExperienceCategory.name,
            experiences: restExperienceCategory.experiences.map { ExperienceMapper(restExperience: $0).map() }
        )
    }
}
