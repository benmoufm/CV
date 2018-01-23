//
//  ExperiencesRepositoryImplementation.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ExperiencesRepositoryImplementation: ExperiencesRepository {
    var httpManager: HttpManager

    init(httpManager: HttpManager) {
        self.httpManager = httpManager
    }

    func getExperienceCategories(completion: ((Result<[ExperienceCategory]>) -> Void)?) {
        let httpRequest = HttpRequest(endPoint: "experience")
        httpManager.execute(httpRequest: httpRequest) { result -> Void in
            let resultExperienceCategories = result.map({ (json) -> [ExperienceCategory] in
                guard let jsonCategories = json["categories"].array
                    else { throw CVError.unexpectedJSONFormat }
                let categories = try jsonCategories
                    .map { try RestExperienceCategory(json: $0) }
                    .map { ExperienceCategoryMapper(restExperienceCategory: $0).map() }
                return categories
            })
            completion?(resultExperienceCategories)
        }
    }

    func getExperienceById(_ id: Int, completion: ((Result<Experience>) -> Void)?) {
        //TODO
    }
}
