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
    let evaluation: Int
    let usageDescription: String

    init(json: JSON) throws {
        guard
            let id = json["id"].int,
            let name = json["name"].string,
            let evaluation = json["value"].int,
            let usageDescription = json["description"].string
        else {
            throw CVError.unexpectedJSONFormat
        }

        self.id = id
        self.name = name
        self.evaluation = evaluation
        self.usageDescription = usageDescription
    }
}
