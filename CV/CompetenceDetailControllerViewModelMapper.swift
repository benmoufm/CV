//
//  CompetenceDetailControllerViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 04/12/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import UIKit

struct CompetenceDetailControllerViewModelMapper {
    let skill: Skill

    func map() -> CompetenceDetailControllerViewModel {
        return CompetenceDetailControllerViewModel(
            title: skill.name,
            evaluation: CGFloat(skill.evaluation) / 5,
            description: skill.usageDescription
        )
    }

}
