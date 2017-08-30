//
//  ContactPresenterImplementation.swift
//  CV
//
//  Created by Mélodie Benmouffek on 30/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class ContactPresenterImplementation: ContactPresenter {

    private unowned let viewContract: ContactViewContract

    // MARK: LifeCycle

    init(viewContract: ContactViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - Startable

    func start() {
        computeAndDisplayViewModel()
    }

    private func computeAndDisplayViewModel() {
        // TODO: (Mélodie Benmouffek) Guard let required properties
        let viewModel = ContactControllerViewModelMapper().map()
        viewContract.configure(with: viewModel)
    }
}
