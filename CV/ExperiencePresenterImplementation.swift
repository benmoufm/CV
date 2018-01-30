//
//  ExperiencePresenterImplementation.swift
//  CV
//
//  Created by Mélodie Benmouffek on 16/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class ExperiencePresenterImplementation: ExperiencePresenter {

    private var viewContract: ExperienceViewContract
    private let experiencesRepository: ExperiencesRepository
    let delegate: ExperiencePresenterDelegate

    // MARK: LifeCycle

    init(viewContract: ExperienceViewContract,
         experiencesRepository: ExperiencesRepository,
         delegate: ExperiencePresenterDelegate) {
        self.viewContract = viewContract
        self.experiencesRepository = experiencesRepository
        self.delegate = delegate
    }

    // MARK: - Startable

    func start() {
        computeAndDisplayViewModel()
    }

    // MARK: - ExperiencePresenter

    // MARK: - private methods

    private func computeAndDisplayViewModel() {
        experiencesRepository.getExperienceCategories() { result -> Void in
            switch result {
            case .value(let experienceCategories):
                let viewModel = ExperienceControllerViewModelMapper(experienceCategories: experienceCategories).map()
                self.viewContract.configure(with: viewModel)
            case .error(let error):
                self.viewContract.displayAlert("experience_error_title_popup".localized, error.localizedDescription)
            }
        }
    }
}
