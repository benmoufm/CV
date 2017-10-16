//
//  PresentationPresenterImplementation.swift
//  CV
//
//  Created by Mélodie Benmouffek on 27/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class PresentationPresenterImplementation: PresentationPresenter {

    private unowned let viewContract: PresentationViewContract

    // MARK: LifeCycle

    init(viewContract: PresentationViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - Startable

    func start() {
        computeAndDisplayViewModel()
    }

    // MARK: - PresentationPresenter

    // MARK: - private methods

    private func computeAndDisplayViewModel() {
        // TODO: (Mélodie Benmouffek) Guard let required properties
        let viewModel = PresentationControllerViewModelMapper().map()
        viewContract.configure(with: viewModel)
    }
}
