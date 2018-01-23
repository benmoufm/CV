//
//  ExperiencesRepository.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol ExperiencesRepository {
    var httpManager: HttpManager { get }

    func getExperienceCategories(completion: ((Result<[ExperienceCategory]>) -> Void)?)
    func getExperienceById(_ id: Int, completion: ((Result<Experience>) -> Void)?)
}
