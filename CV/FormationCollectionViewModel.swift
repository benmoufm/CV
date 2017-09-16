//
//  FormationCollectionViewModel.swift
//  CV
//
//  Created by Mélodie Benmouffek on 15/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct FormationCollectionViewModel {
    let cells: [FormationCellViewModel]

    static let empty = FormationCollectionViewModel(cells: [])
}
