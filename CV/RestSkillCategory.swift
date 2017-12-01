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
    let skills: [Skill]

    init(json: JSON) throws {
        guard
            let id = json["id"].int,
            let name = json["name"].string
        else {
            throw CVError.unexpectedJSONFormat
        }
        var skills: [Skill] = []
        do {
            if let rawSkills = json["skills"].array {
                skills = try rawSkills.map { item -> Skill in
                    return SkillMapper(restSkill: try RestSkill(json: item)).map()
                }
            }
        } catch {
            throw CVError.unexpectedJSONFormat
        }

        self.id = id
        self.name = name
        self.skills = skills
    }
}
