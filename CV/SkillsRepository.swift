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
    func getSkillCategories(completion: ((Result<[SkillCategory]>) -> Void)?)
    func getSkill(with id: Int, completion: ((Result<Skill>) -> Void)?)
    func getSkillsByIds(_ ids: [Int], completion: ((Result<[Skill]>) -> Void)?)
}
