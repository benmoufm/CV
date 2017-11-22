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

    func getSkills(completion: ((Result<[Skill]>) -> Void)?) {
        var resultSkills = Result<[Skill]>([])
        if let url = URL(string: "https://demo6086858.mockable.io/skills") {
            let httpRequest = HttpRequest(url: url)
            httpManager.execute(httpRequest: httpRequest) { result -> Void in
                switch result {
                case .error(let error):
                    resultSkills = .error(error as NSError)
                case .value(let json):
                    let skills = json["skills"].arrayValue.map { item -> Skill in
                        do {
                            return SkillMapper(restSkill: try RestSkill(json: item)).map()
                        } catch {
                            resultSkills = .error(error as NSError)
                            return Skill(name: "", category: SkillCategory.development, evaluation: 0, usageDescription: "")
                        }
                    }
                    if resultSkills.error == nil {
                        resultSkills = .value(skills)
                    }
                }
            }
        } else {
            resultSkills = .error(CVError.competenceOpenJSONUrlError as NSError)
        }
        completion?(resultSkills)
    }

}
