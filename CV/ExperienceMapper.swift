//
//  RestExperienceMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct ExperienceMapper {
    let restExperience: RestExperience

    func map() -> Experience {
        return Experience(
            id: restExperience.id,
            name: restExperience.name,
            timeStamp: restExperience.timeStamp,
            skillsId: restExperience.skillsId,
            description: restExperience.description
        )
    }
}
