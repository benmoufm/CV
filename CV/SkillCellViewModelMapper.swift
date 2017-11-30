//
//  SkillCellViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 04/12/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct SkillCellViewModelMapper {
    let skill: Skill

    func map() -> SkillCellViewModel {
        return SkillCellViewModel(id: skill.id,
                                  name: skill.name,
                                  evaluation: skill.evaluation,
                                  usageDescription: skill.usageDescription)
    }
}
