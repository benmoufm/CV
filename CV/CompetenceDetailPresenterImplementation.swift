//
//  CompetenceDetailPresenterImplementation.swift
//  CV
//
//  Created by Mélodie Benmouffek on 04/12/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class CompetenceDetailPresenterImplementation: CompetenceDetailPresenter {

    private weak var viewContract: CompetenceDetailViewContract?
    private let skillsRepository: SkillsRepository
    private let skillId: Int

    // MARK: LifeCycle

    init(viewContract: CompetenceDetailViewContract,
         skillsRepository: SkillsRepository,
         skillId: Int) {
        self.viewContract = viewContract
        self.skillsRepository = skillsRepository
        self.skillId = skillId
    }

    // MARK: - Startable

    func start() {
        computeAndDisplayViewModel()
    }

    // MARK: - CompetenceDetailPresenter

    // MARK: - private methods

    private func handleError(_ error: Error) {
        // TODO: (Mélodie Benmouffek) 04/12/2017 HandleError
    }

    private func computeAndDisplayViewModel() {
        skillsRepository.getSkill(with: skillId) { result -> Void in
            switch result {
            case .value(let skill):
                let viewModel = CompetenceDetailControllerViewModelMapper(skill: skill).map()
                self.viewContract?.configure(with: viewModel)
            case .error(let error):
                self.viewContract?.displayAlert("competence_error_title_popup".localized, error.localizedDescription)
            }
        }
    }
}
