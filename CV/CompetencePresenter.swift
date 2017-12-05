//
//  CompetencePresenter.swift
//  CV
//
//  Created by Mélodie Benmouffek on 03/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

protocol CompetencePresenterDelegate {
    func presentSkill(id: Int)
}

protocol CompetencePresenter: Startable {
    var delegate: CompetencePresenterDelegate { get }
}
