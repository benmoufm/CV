//
//  ExperienceCellViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct ExperienceCellViewModelMapper {
    let name: String
    let experiences: [Experience]

    func map() -> ExperienceCellViewModel {
        return ExperienceCellViewModel(
            name: name,
            experiences: experiences.map { XPCellViewModelMapper(experience: $0).map() }
        )
    }
}
