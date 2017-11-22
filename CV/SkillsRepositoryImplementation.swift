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
        guard let url = URL(string: "https://demo6086858.mockable.io/skills") else {
            resultSkills = .error(CVError.urlFormatError as NSError)
            return
        }
        let httpRequest = HttpRequest(url: url)
        httpManager.execute(httpRequest: httpRequest) { result -> Void in
            switch result {
            case .error(let error):
                resultSkills = .error(error as NSError)
            case .value(let json):
                do {
                    let skills = try json["skills"].arrayValue.map { item -> Skill in
                        return SkillMapper(restSkill: try RestSkill(json: item)).map()
                    }
                    if resultSkills.error == nil {
                        resultSkills = .value(skills)
                    }
                } catch {
                        resultSkills = .error(error as NSError)
                }
            }
            completion?(resultSkills)
        }
    }

}
