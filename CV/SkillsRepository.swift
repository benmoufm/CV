//
//  SkillsRepository.swift
//  CV
//
//  Created by Mélodie Benmouffek on 21/11/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import SwiftyJSON

class SkillsRepository: JSONParsingRepository {
    var parsedJSON: [Any]

    init() {
        parsedJSON = [Skill]()
    }

    func parseJson(_ httpManager: HttpManager, _ httpRequest: HttpRequest) {
        httpManager.execute(httpRequest: httpRequest) { result -> Void in
            if result.error == nil {
                if let json = result.value {
                    for item in json["skills"].arrayValue {
                        if let category: SkillCategory = SkillCategory(rawValue: item["skill_category_id"].intValue) {
                            let skill = Skill(
                                name: item["name"].stringValue,
                                category: category,
                                evaluation: item["value"].intValue,
                                usageDescription: item["description"].stringValue)
                            self.parsedJSON.append(skill)
                        }
                    }
                }
            }
        }
    }

}
