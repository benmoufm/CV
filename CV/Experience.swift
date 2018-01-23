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
    let skillsId: [Int]
    let description: String

    init(
        id: Int,
        name: String,
        timeStamp: String,
        skillsId: [Int],
        description: String
        ) {
        self.id = id
        self.name = name
        self.timeStamp = timeStamp
        self.skillsId = skillsId
        self.description = description
    }
}
