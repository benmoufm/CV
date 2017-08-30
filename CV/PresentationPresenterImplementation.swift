//
//  PresentationPresenterImplementation.swift
//  CV
//
//  Created by Mélodie Benmouffek on 04/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class PresentationPresenterImplementation: PresentationPresenter {

    private weak var viewContract: PresentationViewContract?

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
        // TODO: (Mélodie Benmouffek) 04/09/2017 Guard let required properties
        let viewModel = PresentationControllerViewModelMapper().map()
        viewContract?.configure(with: viewModel)
    }
}
