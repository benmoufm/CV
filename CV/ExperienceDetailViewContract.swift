//
//  ExperienceDetailViewContract.swift
//  CV
//
//  Created by Mélodie Benmouffek on 30/01/2018.
//Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol ExperienceDetailViewContract: class {

    func configure(with viewModel: ExperienceDetailControllerViewModel)
    func displayAlert(_ title: String, _ message: String)
}
