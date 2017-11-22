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

    func getSkills(_ httpManager: HttpManager, _ httpRequest: HttpRequest, completion: ((Result<[Skill]>) -> Void)?)
}
