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
        var resultSkillCategories = Result<[SkillCategory]>([])
        guard let url = URL(string: "https://demo6086858.mockable.io/skills") else {
            resultSkillCategories = .error(CVError.urlFormatError as NSError)
            completion?(resultSkillCategories)
            return
        }
        let httpRequest = HttpRequest(url: url)
        httpManager.execute(httpRequest: httpRequest) { result -> Void in
            switch result {
            case .error(let error):
                resultSkillCategories = .error(error as NSError)
            case .value(let json):
                do {
                    if let jsonCategories = json["categories"].array {
                        let categories = try jsonCategories
                            .map { try RestSkillCategory(json: $0) }
                            .map { SkillCategoryMapper(restSkillCategory: $0).map() }
                        resultSkillCategories = .value(categories)
                    } else {
                        resultSkillCategories = .error(CVError.unexpectedJSONFormat as NSError)
                    }
                } catch {
                    resultSkillCategories = .error(error as NSError)
                }
            }
            completion?(resultSkillCategories)
        }
    }

    func getSkillById(_ id: Int, completion: ((Result<Skill>) -> Void)?) {
        var resultSkill = Result<Skill>(Skill())
        guard let url = URL(string: "https://demo6086858.mockable.io/skills") else {
            resultSkill = .error(CVError.urlFormatError as NSError)
            completion?(resultSkill)
            return
        }
        let httpRequest = HttpRequest(url: url)
        httpManager.execute(httpRequest: httpRequest) { result in
            switch result {
            case .error(let error):
                resultSkill = .error(error as NSError)
            case .value(let json):
                do {
                    if let jsonCategories = json["categories"].array {
                        let skill = try jsonCategories
                            .map { try RestSkillCategory(json: $0) }
                            .map { SkillCategoryMapper(restSkillCategory: $0).map() }
                            .map { $0.skills.filter { $0.id == id } }
                            .flatMap{ $0 }
                        if let uniqueSkill = skill.first {
                            resultSkill = .value(uniqueSkill)
                        } else {
                            resultSkill = .error(CVError.unknownSkillId as NSError)
                        }
                    }
                } catch {
                    resultSkill = .error(error as NSError)
                }
            }
            completion?(resultSkill)
        }
    }

}
