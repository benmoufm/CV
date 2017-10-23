//
//  ExperienceTableViewModel.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct ExperienceTableViewModel {

    let tableCells: [ExperienceCellViewModel]

    static let empty = ExperienceTableViewModel(tableCells: [])
}
