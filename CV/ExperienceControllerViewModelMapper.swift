//
//  ExperienceControllerViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 16/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct ExperienceControllerViewModelMapper {

    func map() -> ExperienceControllerViewModel {
        return ExperienceControllerViewModel(tableView: ExperienceTableViewModelMapper().map())
    }

}
