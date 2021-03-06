//
//  LocalContactRepository.swift
//  CV
//
//  Created by Mélodie Benmouffek on 03/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit
import Contacts

class LocalContactRepository: ContactRepository {

    lazy var melodieContact: CNContact = self.intializeMelodieContact()

    // MARK: LifeCycle

    init() {
        // TODO: (Mélodie Benmouffek) Initialize with repository dependencies
    }

    // MARK: - ContactRepository

    func createContact(_ contact: CNContact, _ completion: ((Result<Void>) -> Void)?) {
        let contactStore = CNContactStore()
        var result = Result<Void>()
        defer {
            completion?(result)
        }
        contactStore.requestAccess(for: CNEntityType.contacts) { (granted, error) -> Void in
            if !granted || error != nil {
                result = .error(CVError.contactAccessDeniedError as NSError)
                return
            }
            let store = CNContactStore()
            let saveRequest = CNSaveRequest()
            guard let mutableContact = contact.mutableCopy() as? CNMutableContact else {
                result = .error(CVError.contactCreationError as NSError)
                return
            }
            saveRequest.add(mutableContact, toContainerWithIdentifier:nil)
            do {
                try store.execute(saveRequest)
            } catch {
                result = .error(CVError.contactCreationError as NSError)
            }
        }
    }

    // MARK: - Private functions

    private func intializeMelodieContact() -> CNContact {
        let contact = CNMutableContact()
        contact.givenName = "Mélodie"
        contact.familyName = "Benmouffek"

        contact.emailAddresses = [CNLabeledValue(
            label: CNLabelHome,
            value: "m.benmouffek@gmail.com" as NSString)]

        contact.phoneNumbers = [CNLabeledValue(
            label:CNLabelPhoneNumberiPhone,
            value:CNPhoneNumber(stringValue:"0661042595"))]

        let homeAddress = CNMutablePostalAddress()
        homeAddress.street = "40 rue Mercière"
        homeAddress.city = "Lyon"
        homeAddress.country = "France"
        homeAddress.postalCode = "69002"
        contact.postalAddresses = [CNLabeledValue(label:CNLabelHome, value:homeAddress)]

        let birthday = NSDateComponents()
        birthday.day = 21
        birthday.month = 3
        birthday.year = 1995
        contact.birthday = birthday as DateComponents

        contact.imageData = UIImagePNGRepresentation(#imageLiteral(resourceName: "pictureCV"))

        return contact.copy() as! CNContact
    }
}
