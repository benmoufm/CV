//
//  RestExperience.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import SwiftyJSON

struct RestExperience {
    let id: Int
    let name: String
    let timeStamp: String
    let skillsId: [Int]
    let description: String

    init(json: JSON) throws {
        guard
            let id = json["id"].int,
            let name = json["name"].string,
            let jsonSkills = json["skills_id"].array,
            let description = json["description"].string
            else { throw CVError.unexpectedJSONFormat }
        var timeStamp: String
        if let duration = json["duration"].string {
            timeStamp = duration
        } else {
            guard
                let startDate = json["startDate"].string,
                let endDate = json["endDate"].string
                else { throw CVError.unexpectedJSONFormat }
            timeStamp = "\(startDate) - \(endDate)"
        }
        let skillsId = try jsonSkills.map { skillId -> Int in
            guard let id = skillId.int
                else { throw CVError.unexpectedJSONFormat }
            return id
        }

        self.id = id
        self.name = name
        self.timeStamp = timeStamp
        self.skillsId = skillsId
        self.description = description
    }
}
