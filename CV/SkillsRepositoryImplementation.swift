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

    func getSkills(completion: ((Result<[SkillCategory]>) -> Void)?) {
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
                    if let rawCategories = json["categories"].array {
                        let categories = try rawCategories.map { item -> SkillCategory in
                            return SkillCategoryMapper(restSkillCategory: try RestSkillCategory(json: item)).map()
                        }
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

}
