//
//  Experience.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct Experience {
    let id: Int
    let name: String
    let timeStamp: String
    let skillsID: [Int]
    let description: String

    init() {
        self.id = -1
        self.name = ""
        self.timeStamp = ""
        self.skillsID = []
        self.description = ""
    }

    init(id: Int, name: String, timeStamp: String, skillsID: [Int], description: String) {
        self.id = id
        self.name = name
        self.timeStamp = timeStamp
        self.skillsID = skillsID
        self.description = description
    }
}
