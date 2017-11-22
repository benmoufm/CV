//
//  SkillsRepositoryImplementation.swift
//  CV
//
//  Created by Mélodie Benmouffek on 21/11/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import SwiftyJSON

class SkillsRepositoryImplementation: SkillsRepository {

    func getSkills(_ httpManager: HttpManager, _ httpRequest: HttpRequest, completion: ((Result<[Skill]>) -> Void)?) {
        var resultSkills = Result<[Skill]>([])
        httpManager.execute(httpRequest: httpRequest) { result -> Void in
            switch result {
            case .error(let error):
                resultSkills = .error(error as NSError)
            case .value(let json):
                var skills = [Skill]()
                for item in json["skills"].arrayValue {
                    do {
                        let restSkill = try RestSkill(json: item)
                        let skillMapper = SkillMapper(restSkill: restSkill)
                        skills.append(skillMapper.map())
                    } catch {
                        resultSkills = .error(error as NSError)
                        break
                    }
                }
                if resultSkills.error == nil {
                    resultSkills = Result<[Skill]>(skills)
                }
            }
        }
        completion?(resultSkills)
    }

}
