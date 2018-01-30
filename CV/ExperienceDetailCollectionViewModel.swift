//
//  ExperienceDetailCollectionViewModel.swift
//  CV
//
//  Created by Mélodie Benmouffek on 30/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct ExperienceDetailCollectionViewModel {
    let cells: [ExperienceDetailCellViewModel]

    static let empty = ExperienceDetailCollectionViewModel(cells: [])
}
