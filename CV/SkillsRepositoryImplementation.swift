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
        let httpRequest = HttpRequest(domain: "skills")
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

}
