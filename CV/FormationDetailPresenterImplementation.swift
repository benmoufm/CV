//
//  FormationDetailPresenterImplementation.swift
//  CV
//
//  Created by Mélodie Benmouffek on 19/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class FormationDetailPresenterImplementation: FormationDetailPresenter {

    private weak var viewContract: FormationDetailViewContract?

    // MARK: LifeCycle

    init(viewContract: FormationDetailViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - Startable

    func start() {
        computeAndDisplayViewModel()
    }

    // MARK: - FormationDetailPresenter

    // MARK: - private methods

    private func handleError(_ error: Error) {
        // TODO: (Mélodie Benmouffek) 19/09/2017 HandleError
    }

    private func computeAndDisplayViewModel() {
        // TODO: (Mélodie Benmouffek) 19/09/2017 Guard let required properties
        let viewModel = FormationDetailControllerViewModelMapper().map()
        viewContract?.configure(with: viewModel)
    }
}
