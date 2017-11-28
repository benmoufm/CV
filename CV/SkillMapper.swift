//
//  SkillMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 28/11/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct SkillMapper {
    let restSkill: RestSkill

    func map() -> Skill {
        return Skill (
            name: restSkill.name,
            category: SkillCategory(rawValue: restSkill.categoryId)!,
            evaluation: restSkill.evaluation,
            usageDescription: restSkill.usageDescription
        )
    }
}
