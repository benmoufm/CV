//
//  RepositoryFactory.swift
//  CV
//
//  Created by Mélodie Benmouffek on 03/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

final class RepositoryFactory {

    static let sharedInstance = RepositoryFactory()
    private(set) lazy var contactRepository: ContactRepository = LocalContactRepository()
    private(set) lazy var mailRepository: MailRepository = TemplateMailRepository()
    private(set) lazy var skillsRepository: SkillsRepository = SkillsRepositoryImplementation()

    private init() {}

}
