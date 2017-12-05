//
//  Skill.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct Skill {

    init() {
        self.id = -1
        self.name = ""
        self.evaluation = 0
        self.usageDescription = ""
    }

    init(id: Int, name: String, evaluation: Int, usageDescription: String) {
        self.id = id
        self.name = name
        self.evaluation = evaluation
        self.usageDescription = usageDescription
    }

    let id: Int
    let name: String
    let evaluation: Int
    let usageDescription: String
}
