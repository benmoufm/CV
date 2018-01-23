//
//  RestExperienceCategory.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import SwiftyJSON

struct RestExperienceCategory {
    let id: Int
    let name: String
    let experiences: [RestExperience]

    init(json: JSON) throws {
        guard
            let id = json["id"].int,
            let name = json["name"].string,
            let jsonExperiences = json["experiences"].array
            else {
                throw CVError.unexpectedJSONFormat
        }
        var restExperiences: [RestExperience] = []
        restExperiences = try jsonExperiences.map { try RestExperience(json: $0) }

        self.id = id
        self.name = name
        self.experiences = restExperiences
    }
}
