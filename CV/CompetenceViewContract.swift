//
//  CompetenceViewContract.swift
//  CV
//
//  Created by Mélodie Benmouffek on 03/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol CompetenceViewContract: class {

    func configure(with viewModel: CompetenceControllerViewModel)
    func displayPopup(_ title: String, _ message: String)
}
