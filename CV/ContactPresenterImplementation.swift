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

class ContactPresenterImplementation: UIViewController, ContactPresenter {

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
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            var message: String
            if success {
                message = "contact_creation_success_message_popup".localized
            } else {
                message = "contact_creation_error_message_popup".localized
            }
            let alert = UIAlertController(title: "contact_creation_title_popup".localized,
                                          message: message,
                                          preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "contact_creation_button_text_popup".localized,
                                          style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    func sendMail() {
        mailRepository.sendMail(contactInfo) { success -> Void in
            if success {
                // TODO : Success
            } else {
                // TODO : Fail
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
