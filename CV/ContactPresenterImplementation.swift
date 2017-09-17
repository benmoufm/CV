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
    private var hasAlreadyCreatedContact = false
    private var hasAlreadyAddedLinkedInProfile = false
    private var isLoading = false

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
        guard !hasAlreadyCreatedContact else { return }
        contactRepository.createContact(contactInfo) { result -> Void in
            self.viewContract.startLoading()
            if let resultingError = result.error {
                self.viewContract.stopLoading()
                self.computeAndDisplayViewModel()
                self.viewContract.displayPopup("contact_creation_title_popup".localized, resultingError.localizedDescription)
            } else {
                self.hasAlreadyCreatedContact = true
            }
            self.viewContract.stopLoading()
            self.computeAndDisplayViewModel()
        }
    }

    func sendMail() {
        mailRepository.sendMail(contactInfo) { result -> Void in
            if let resultingError = result.error {
                self.viewContract.displayPopup("mail_error_title_popup".localized, resultingError.localizedDescription)
            }
        }
    }

    // MARK: - Private methods

    private func computeAndDisplayViewModel() {
        let viewModel = ContactControllerViewModelMapper(
            hasAlreadyCreatedContact: hasAlreadyCreatedContact,
            hasAlreadyAddedLinkedInProfile: hasAlreadyAddedLinkedInProfile,
            isLoading: isLoading
            ).map()
        viewContract.configure(with: viewModel)
    }
}
