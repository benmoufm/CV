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
    private let mailRepository: MailRepository

    var contactInfo: CNContact

    // MARK: LifeCycle

    init(viewContract: ContactViewContract,
         contactRepository: ContactRepository,
         mailRepository: MailRepository) {
        self.viewContract = viewContract
        self.contactRepository = contactRepository
        self.mailRepository = mailRepository
        contactInfo = contactRepository.melodieContact
    }

    // MARK: - Startable

    func start() {
        computeAndDisplayViewModel()
    }

    // MARK: - ContactPresenter

    func call(_ url: URL) {
        guard UIApplication.shared.canOpenURL(url) else {
            viewContract.displayPopup("phone_error_popup_title".localized,
                                      "phone_error_popup_text".localized)
            return
        }
        UIApplication.shared.open(url)
    }

    func openLinkedIn(_ url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            self.viewContract.displayPopup("linkedin_error_title_popup".localized,
                                           "linkedin_error_popup".localized)
        }
    }

    func createContact() {
        contactRepository.createContact(contactInfo) { success -> Void in
            var message: String
            if success {
                message = "contact_creation_success_message_popup".localized
            } else {
                message = "contact_creation_error_message_popup".localized
            }
            self.viewContract.displayPopup("contact_creation_title_popup".localized, message)
        }
    }

    func sendMail() {
        mailRepository.sendMail(contactInfo) { message -> Void in
            self.viewContract.displayPopup("mail_error_title_popup".localized, message)
        }
    }

    // MARK: - Private methods

    private func computeAndDisplayViewModel() {
        // TODO: (Mélodie Benmouffek) Guard let required properties
        let viewModel = ContactControllerViewModelMapper().map()
        viewContract.configure(with: viewModel)
    }
}
