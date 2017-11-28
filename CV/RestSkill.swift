//
//  RestSkill.swift
//  CV
//
//  Created by Mélodie Benmouffek on 28/11/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import SwiftyJSON

struct RestSkill {
    let id: Int
    let name: String
    let isCategory: Bool
    let category: SkillCategory
    let evaluation: Int
    let usageDescription: String

    init(json: JSON) throws {
        guard
            let id = json["id"].int,
            let name = json["name"].string,
            let isCategory = json["is_category"].bool,
            let categoryID = json["skill_category_id"].int,
            let category = SkillCategory(rawValue: categoryID),
            let evaluation = json["value"].int,
            let usageDescription = json["description"].string
        else {
            throw CVError.unexpectedJSONFormat
        }

        self.id = id
        self.name = name
        self.isCategory = isCategory
        self.category = category
        self.evaluation = evaluation
        self.usageDescription = usageDescription
    }
}
