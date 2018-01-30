//
//  ExperiencePresenter.swift
//  CV
//
//  Created by Mélodie Benmouffek on 16/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol ExperiencePresenterDelegate {
    func presentForId(_ presenter: ExperiencePresenter, id: Int)
}

protocol ExperiencePresenter: Startable {
    var delegate: ExperiencePresenterDelegate { get }
}
