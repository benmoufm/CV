//
//  ContactTableViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 01/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

struct ContactTableViewModelMapper {

    let hasAlreadyCreatedContact: Bool
    let hasAlreadyAddedLinkedInProfile: Bool

    func map() -> ContactTableViewModel {
        let phoneCell = ContactCellViewModelMapper(
            image: #imageLiteral(resourceName: "phoneIcon"),
            label: "Telephone : 06.61.04.25.95",
            textColor: UIColor.textColor,
            cellType: .phone(url: URL(string: "tel://0661042595")),
            isSelected: false
        ).map()

        let mailCell = ContactCellViewModelMapper(
            image: #imageLiteral(resourceName: "emailIcon"),
            label: "Email : m.benmouffek@gmail.com",
            textColor: UIColor.textColor,
            cellType: .mail,
            isSelected: false
        ).map()


        let linkdInCell = ContactCellViewModelMapper(
            image: #imageLiteral(resourceName: "linkdInIcon"),
            label: "Profil LinkedIn",
            textColor: UIColor.textColor,
            cellType: .linkedin(url: URL(string: "linkedin://profile?id=60930a124")),
            isSelected: hasAlreadyAddedLinkedInProfile
        ).map()

        let newContactCell = ContactCellViewModelMapper(
            image: #imageLiteral(resourceName: "contactIcon"),
            label: "Ajouter le contact",
            textColor: UIColor.textColor,
            cellType: .contact,
            isSelected: hasAlreadyCreatedContact
        ).map()

        return ContactTableViewModel(tableCells: [phoneCell, mailCell, linkdInCell, newContactCell])
    }

}
