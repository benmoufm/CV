//
//  CompetenceControllerViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 03/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct CompetenceControllerViewModelMapper {

    func map() -> CompetenceControllerViewModel {
        return CompetenceControllerViewModel(tableView: CompetenceTableViewModelMapper().map())
    }

}
