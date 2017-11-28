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
    let categoryId: Int
    let evaluation: Int
    let usageDescription: String

    init(json: JSON) throws {
        if let id = json["id"].int { self.id = id } else { throw json["id"].error! }
        if let name = json["name"].string { self.name = name } else { throw json["name"].error! }
        if let categoryId = json["skill_category_id"].int {
            self.categoryId = categoryId
        } else {
            throw json["skill_category_id"].error!
        }
        if let evaluation = json["value"].int { self.evaluation = evaluation } else {
            throw json["value"].error!
        }
        if let usageDescription = json["description"].string {
            self.usageDescription = usageDescription
        } else {
            throw json["description"].error!
        }
    }
}
