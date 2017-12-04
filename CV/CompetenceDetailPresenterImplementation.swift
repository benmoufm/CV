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

    // MARK: LifeCycle

    init(viewContract: CompetenceDetailViewContract) {
        self.viewContract = viewContract
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
        // TODO: (Mélodie Benmouffek) 04/12/2017 Guard let required properties
        let viewModel = CompetenceDetailControllerViewModelMapper().map()
        viewContract?.configure(with: viewModel)
    }
}
