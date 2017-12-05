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

    let httpManager: HttpManager

    init() {
        let configuration = URLSessionConfiguration.default
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        httpManager = HttpManager(sessionManager: sessionManager)
    }

    func getSkillCategories(completion: ((Result<[SkillCategory]>) -> Void)?) {
        let httpRequest = HttpRequest(endPoint: "skills")
        httpManager.execute(httpRequest: httpRequest) { result -> Void in
            let resultSkillCategories = result.map { (json) -> [SkillCategory] in
                guard let jsonCategories = json["categories"].array
                    else { throw CVError.unexpectedJSONFormat }
                let categories = try jsonCategories
                    .map { try RestSkillCategory(json: $0) }
                    .map { SkillCategoryMapper(restSkillCategory: $0).map() }
                return categories
            }
            completion?(resultSkillCategories)
        }
    }

    func getSkill(_ id: Int, completion: ((Result<Skill>) -> Void)?) {
        let httpRequest = HttpRequest(endPoint: "skills")
        httpManager.execute(httpRequest: httpRequest) { result in
            let resultSkill = result.map { (json) -> Skill in
                if let jsonCategories = json["categories"].array {
                    let skill = try jsonCategories
                        .map { try RestSkillCategory(json: $0) }
                        .map { SkillCategoryMapper(restSkillCategory: $0).map() }
                        .flatMap { $0.skills }
                    guard let uniqueSkill = skill.first(where: { $0.id == id })
                        else { throw CVError.unknownSkillId }
                    return uniqueSkill
                } else { throw CVError.unexpectedJSONFormat }
            }
            completion?(resultSkill)
        }
    }

}
