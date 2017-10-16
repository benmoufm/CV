//
//  ExperiencePresenterImplementation.swift
//  CV
//
//  Created by Mélodie Benmouffek on 16/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class ExperiencePresenterImplementation: ExperiencePresenter {

    private weak var viewContract: ExperienceViewContract?

    // MARK: LifeCycle

    init(viewContract: ExperienceViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - Startable

    func start() {
        computeAndDisplayViewModel()
    }

    // MARK: - ExperiencePresenter

    // MARK: - private methods

    private func handleError(_ error: Error) {
        // TODO: (Mélodie Benmouffek) 16/10/2017 HandleError
    }

    private func computeAndDisplayViewModel() {
        // TODO: (Mélodie Benmouffek) 16/10/2017 Guard let required properties
        let viewModel = ExperienceControllerViewModelMapper().map()
        viewContract?.configure(with: viewModel)
    }
}
