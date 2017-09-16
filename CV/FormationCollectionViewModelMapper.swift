//
//  FormationCollectionViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 15/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct FormationCollectionViewModelMapper {
    func map() -> FormationCollectionViewModel {
        let sigisCell = FormationCellViewModelMapper(image: #imageLiteral(resourceName: "sigisIcon")).map()
        let lamalgrangeCell = FormationCellViewModelMapper(image: #imageLiteral(resourceName: "lamalgrangeIcon")).map()
        let ensimagCell = FormationCellViewModelMapper(image: #imageLiteral(resourceName: "ensimagIcon")).map()
        let solutecCell = FormationCellViewModelMapper(image: #imageLiteral(resourceName: "solutecIcon")).map()
        return FormationCollectionViewModel(cells: [sigisCell, lamalgrangeCell,
                                                    ensimagCell, solutecCell])
    }
}
