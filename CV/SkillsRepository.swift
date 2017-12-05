//
//  SkillsRepository.swift
//  CV
//
//  Created by Mélodie Benmouffek on 21/11/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import Alamofire

protocol SkillsRepository {

    var httpManager: HttpManager { get }

    func getSkillCategories(completion: ((Result<[SkillCategory]>) -> Void)?)
    func getSkill(_ id: Int, completion: ((Result<Skill>) -> Void)?)
}
