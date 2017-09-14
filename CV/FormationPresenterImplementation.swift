//
//  FormationPresenterImplementation.swift
//  CV
//
//  Created by Mélodie Benmouffek on 14/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class FormationPresenterImplementation: FormationPresenter {

    private unowned let viewContract: FormationViewContract

    // MARK: LifeCycle

    init(viewContract: FormationViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - Startable

    func start() {
        computeAndDisplayViewModel()
    }

    // MARK: - FormationPresenter

    // MARK: - private methods

    private func computeAndDisplayViewModel() {
        // TODO: (Mélodie Benmouffek) 14/09/2017 Guard let required properties
        let viewModel = FormationControllerViewModelMapper().map()
        viewContract.configure(with: viewModel)
    }
}
