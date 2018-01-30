//
//  ExperienceDetailPresenterImplementation.swift
//  CV
//
//  Created by Mélodie Benmouffek on 30/01/2018.
//Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class ExperienceDetailPresenterImplementation: ExperienceDetailPresenter {

    private weak var viewContract: ExperienceDetailViewContract?
    private let experienceRepository: ExperiencesRepository
    private let skillRepository: SkillsRepository
    private let experienceId: Int

    // MARK: LifeCycle

    init(viewContract: ExperienceDetailViewContract,
         experienceRepository: ExperiencesRepository,
         skillRepository: SkillsRepository,
         experienceId: Int) {
        self.viewContract = viewContract
        self.experienceRepository = experienceRepository
        self.skillRepository = skillRepository
        self.experienceId = experienceId
    }

    // MARK: - Startable

    func start() {
        computeAndDisplayViewModel()
    }

    // MARK: - ExperienceDetailPresenter

    // MARK: - private methods

    private func handleError(_ error: Error) {
        // TODO: (Mélodie Benmouffek) 30/01/2018 HandleError
    }

    private func computeAndDisplayViewModel() {
        experienceRepository.getExperienceById(experienceId) { (result) in
            switch result {
            case .value(let experience):
                let skills = experience.skillsID.map { id -> Skill in
                    var skill = Skill()
                    self.skillRepository.getSkillById(id, completion: { (result) in
                        switch result {
                        case .value(let value):
                            skill = value
                        case .error(let error):
                            self.viewContract?.displayAlert("experience_error_title_popup".localized, error.localizedDescription)
                        }
                    })
                    return skill
                }
                let viewModel = ExperienceDetailControllerViewModelMapper(experience: experience, skills: skills).map()
                self.viewContract?.configure(with: viewModel)
            case .error(let error):
                self.viewContract?.displayAlert("experience_error_title_popup".localized, error.localizedDescription)
            }
        }
    }
}
