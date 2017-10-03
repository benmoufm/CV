//
//  CompetencePresenterImplementation.swift
//  CV
//
//  Created by Mélodie Benmouffek on 03/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class CompetencePresenterImplementation: CompetencePresenter {

    private weak var viewContract: CompetenceViewContract?

    // MARK: LifeCycle

    init(viewContract: CompetenceViewContract) {
        self.viewContract = viewContract
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
        // TODO: (Mélodie Benmouffek) 03/10/2017 Guard let required properties
        let viewModel = CompetenceControllerViewModelMapper().map()
        viewContract?.configure(with: viewModel)
    }
}
