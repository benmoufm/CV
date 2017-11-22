//
//  SkillsRepository.swift
//  CV
//
//  Created by Mélodie Benmouffek on 21/11/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class SkillsRepository: JSONParsingRepository {
    var parsedJSON: [String: Any]

    init() {
        parsedJSON = [String: Skill]()
    }

    func parseJson(_ httpManager: HttpManager, _ httpRequest: HttpRequest) {
        httpManager.getJSONResults(httpRequest: httpRequest) { result -> Void in
            if result.error == nil {
                // TODO: Parse JSON and set parsedJSON
            }
        }
    }

}
