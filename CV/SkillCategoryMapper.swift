//
//  SkillCategoryMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 01/12/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct SkillCategoryMapper {
    let restSkillCategory: RestSkillCategory

    func map() -> SkillCategory {
        return SkillCategory (
            id: restSkillCategory.id,
            name: restSkillCategory.name,
            skills: restSkillCategory.restSkills.map { SkillMapper(restSkill: $0).map() }
        )
    }
}
