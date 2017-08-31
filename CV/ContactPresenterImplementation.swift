//
//  ContactPresenterImplementation.swift
//  CV
//
//  Created by Mélodie Benmouffek on 30/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit
import Contacts

class ContactPresenterImplementation: ContactPresenter {

    private unowned let viewContract: ContactViewContract
    private let contactRepository: ContactRepository

    var contactInfo: CNContact

    // MARK: LifeCycle

    init(viewContract: ContactViewContract, contactRepository: ContactRepository) {
        self.viewContract = viewContract
        self.contactRepository = contactRepository
        contactInfo = contactRepository.melodieContact
    }

    // MARK: - Startable

    func start() {
        computeAndDisplayViewModel()
    }

    // MARK: - ContactPresenter

    func call(_ url: URL) {
        UIApplication.shared.open(url)
    }

    func createContact() {
        contactRepository.createContact(contactInfo) { success -> Void in
            if success {
                // TODO : Faire pop up Success
            } else {
                // TODO : pop up Fail
            }
        }
    }

    // MARK: - Private methods

    private func computeAndDisplayViewModel() {
        // TODO: (Mélodie Benmouffek) Guard let required properties
        let viewModel = ContactControllerViewModelMapper().map()
        viewContract.configure(with: viewModel)
    }
}
