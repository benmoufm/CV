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

    init() {
        let configuration = URLSessionConfiguration.default
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        httpManager = HttpManager(sessionManager: sessionManager)
    }

    func getExperienceCategories(completion: ((Result<[ExperienceCategory]>) -> Void)?) {
        var resultExperienceCategories = Result<[ExperienceCategory]>([])
        guard let url = URL(string: "https://demo6086858.mockable.io/experience") else {
            resultExperienceCategories = .error(CVError.urlFormatError as NSError)
            completion?(resultExperienceCategories)
            return
        }
        let httpRequest = HttpRequest(url: url)
        httpManager.execute(httpRequest: httpRequest) { result -> Void in
            switch result {
            case .error(let error):
                resultExperienceCategories = .error(error as NSError)
            case .value(let json):
                do {
                    if let jsonCategories = json["categories"].array {
                        let categories = try jsonCategories
                            .map { try RestExperienceCategory(json: $0) }
                            .map { ExperienceCategoryMapper(restExperienceCategory: $0).map() }
                        resultExperienceCategories = .value(categories)
                    } else {
                        resultExperienceCategories = .error(CVError.unexpectedJSONFormat as NSError)
                    }
                } catch {
                    resultExperienceCategories = .error(error as NSError)
                }
            }
            completion?(resultExperienceCategories)
        }
    }

    func getExperienceById(_ id: Int, completion: ((Result<Experience>) -> Void)?) {

    }
}
