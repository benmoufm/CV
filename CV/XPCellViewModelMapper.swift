//
//  XPCellViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 24/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct XPCellViewModelMapper {
    let experience: Experience

    func map() -> XPCellViewModel {
        return XPCellViewModel(
            id: experience.id,
            name: experience.name,
            timeStamp: experience.timeStamp,
            skillsID: experience.skillsID,
            description: experience.description
        )
    }
}
