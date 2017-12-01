//
//  RestSkillCategory.swift
//  CV
//
//  Created by Mélodie Benmouffek on 01/12/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import SwiftyJSON

struct RestSkillCategory {
    let id: Int
    let name: String
    let restSkills: [RestSkill]

    init(json: JSON) throws {
        guard
            let id = json["id"].int,
            let name = json["name"].string,
            let jsonSkills = json["skills"].array
        else {
            throw CVError.unexpectedJSONFormat
        }
        var restSkills: [RestSkill] = []
        restSkills = try jsonSkills.map { try RestSkill(json: $0) }

        self.id = id
        self.name = name
        self.restSkills = restSkills
    }
}
