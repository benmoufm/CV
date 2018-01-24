//
//  RepositoryFactory.swift
//  CV
//
//  Created by Mélodie Benmouffek on 03/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import Alamofire

final class RepositoryFactory {

    static let sharedInstance = RepositoryFactory()
    private var httpManager: HttpManager
    private(set) lazy var contactRepository: ContactRepository = LocalContactRepository()
    private(set) lazy var mailRepository: MailRepository = TemplateMailRepository()

    private init() {
        let configuration = URLSessionConfiguration.default
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        self.httpManager = HttpManager(sessionManager: sessionManager)
    }

    func skillsRepository() -> SkillsRepository {
        return SkillsRepositoryImplementation()
    }

    func experiencesRepository() -> ExperiencesRepository {
        return ExperiencesRepositoryImplementation(httpManager: httpManager)
    }

}
