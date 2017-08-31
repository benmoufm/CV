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

    // MARK: LifeCycle

    init(viewContract: ContactViewContract) {
        self.viewContract = viewContract
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
        let contactStore = CNContactStore()
        contactStore.requestAccess(for: CNEntityType.contacts, completionHandler: { (true, nil) -> Void in })

        let contact = CNMutableContact()

        contact.givenName = "Mélodie"
        contact.familyName = "Benmouffek"

        //let homeEmail = CNLabeledValue(label: CNLabelHome, value: "m.benmouffek@gmail.com")
        //contact.emailAddresses = [homeEmail, nil]

        contact.phoneNumbers = [CNLabeledValue(
            label:CNLabelPhoneNumberiPhone,
            value:CNPhoneNumber(stringValue:"0661042595"))]

        let homeAddress = CNMutablePostalAddress()
        homeAddress.street = "40 rue Mercière"
        homeAddress.city = "Lyon"
        homeAddress.state = "France"
        homeAddress.postalCode = "69002"
        contact.postalAddresses = [CNLabeledValue(label:CNLabelHome, value:homeAddress)]

        let birthday = NSDateComponents()
        birthday.day = 21
        birthday.month = 3
        birthday.year = 1995
        contact.birthday = birthday as DateComponents

        // Saving the newly created contact
        let store = CNContactStore()
        let saveRequest = CNSaveRequest()
        saveRequest.add(contact, toContainerWithIdentifier:nil)
        try! store.execute(saveRequest)
    }

    // MARK: - Private methods

    private func computeAndDisplayViewModel() {
        // TODO: (Mélodie Benmouffek) Guard let required properties
        let viewModel = ContactControllerViewModelMapper().map()
        viewContract.configure(with: viewModel)
    }
}
