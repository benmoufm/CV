//
//  ContactTableViewModel.swift
//  CV
//
//  Created by Mélodie Benmouffek on 01/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct ContactTableViewModel {

    let tableCells: [ContactCellViewModel]

    static let empty = ContactTableViewModel(tableCells: [])
}
