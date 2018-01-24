//
//  SkillsRepositoryImplementation.swift
//  CV
//
//  Created by Mélodie Benmouffek on 21/11/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class SkillsRepositoryImplementation: SkillsRepository {

    var httpManager: HttpManager

    init(httpManager: HttpManager) {
        self.httpManager = httpManager
    }

    func getSkillCategories(completion: ((Result<[SkillCategory]>) -> Void)?) {
        let httpRequest = HttpRequest(endPoint: "skills")
        httpManager.execute(httpRequest: httpRequest) { result -> Void in
            let resultSkillCategories = result.map({ (json) -> [SkillCategory] in
                guard let jsonCategories = json["categories"].array
                    else { throw CVError.unexpectedJSONFormat }
                let categories = try jsonCategories
                    .map { try RestSkillCategory(json: $0) }
                    .map { SkillCategoryMapper(restSkillCategory: $0).map() }
                return categories
            })
            completion?(resultSkillCategories)
        }
    }

    func getSkill(with id: Int, completion: ((Result<Skill>) -> Void)?) {
        let httpRequest = HttpRequest(endPoint: "skills")
        httpManager.execute(httpRequest: httpRequest) { result in
            let resultSkill = result.map({ (json) -> Skill in
                if let jsonCategories = json["categories"].array {
                    let skill = try jsonCategories
                        .map { try RestSkillCategory(json: $0) }
                        .map { SkillCategoryMapper(restSkillCategory: $0).map() }
                        .map { $0.skills.filter { $0.id == id } }
                        .flatMap{ $0 }
                    guard let uniqueSkill = skill.first else { throw CVError.unknownSkillId }
                    return uniqueSkill
                } else { throw CVError.unexpectedJSONFormat }
            })
            completion?(resultSkill)
        }
    }

}
