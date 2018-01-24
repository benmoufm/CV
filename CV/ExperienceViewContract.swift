//
//  ExperienceViewContract.swift
//  CV
//
//  Created by Mélodie Benmouffek on 16/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol ExperienceViewContract: class {

    func configure(with viewModel: ExperienceControllerViewModel)
    func displayAlert(_ title: String, _ message: String)
}
