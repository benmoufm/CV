//
//  HomePresenterImplementation.swift
//  CV
//
//  Created by Mélodie Benmouffek on 20/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class HomePresenterImplementation: HomePresenter {

    private unowned let viewContract: HomeViewContract

    // MARK: LifeCycle

    init(viewContract: HomeViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - Startable

    func start() {
    }

    // MARK: - HomePresenter

    // MARK: - private methods

    private func computeAndDisplayViewModel() {
        // TODO: (Mélodie Benmouffek) Guard let required properties
        let viewModel = HomeControllerViewModelMapper().map()
        viewContract.configure(with: viewModel)
    }
}
