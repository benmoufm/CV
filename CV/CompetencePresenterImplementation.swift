//
//  CompetencePresenterImplementation.swift
//  CV
//
//  Created by Mélodie Benmouffek on 03/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class CompetencePresenterImplementation: CompetencePresenter {

    private var viewContract: CompetenceViewContract
    private let skillsRepository: SkillsRepository
    let delegate: CompetencePresenterDelegate

    // MARK: LifeCycle

    init(viewContract: CompetenceViewContract,
         skillsRepository: SkillsRepository,
         delegate: CompetencePresenterDelegate) {
        self.viewContract = viewContract
        self.skillsRepository = skillsRepository
        self.delegate = delegate
    }

    // MARK: - Startable

    func start() {
        computeAndDisplayViewModel()
    }

    // MARK: - CompetencePresenter

    // MARK: - private methods

    private func handleError(_ error: Error) {
        // TODO: (Mélodie Benmouffek) 03/10/2017 HandleError
    }

    private func computeAndDisplayViewModel() {
        skillsRepository.getSkillCategories() { result -> Void in
            switch result {
            case .value(let skillCategories):
                let viewModel = CompetenceControllerViewModelMapper(skillCategories: skillCategories).map()
                self.viewContract.configure(with: viewModel)
            case .error(let error):
                self.viewContract.displayAlert("competence_error_title_popup".localized, error.localizedDescription)
            }
        }
    }
}
