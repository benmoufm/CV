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

    func map() -> ContactTableViewModel {
        let phoneCell = ContactCellViewModelMapper(
            image: #imageLiteral(resourceName: "phoneIcon"),
            label: "Telephone : 06.61.04.25.95",
            textColor: UIColor.textColor,
            backgroundColor: UIColor.black, 
            url: URL(string: "tel://0661042595"),
            shouldCreateContactOnSelect: false,
            shouldSendMailOnSelect: false
        ).map()

        let mailCell = ContactCellViewModelMapper(
            image: #imageLiteral(resourceName: "emailIcon"),
            label: "Email : m.benmouffek@gmail.com",
            textColor: UIColor.textColor,
            backgroundColor: UIColor.black,
            url: nil,
            shouldCreateContactOnSelect: false,
            shouldSendMailOnSelect: true
        ).map()


        let linkdInCell = ContactCellViewModelMapper(
            image: #imageLiteral(resourceName: "linkdInIcon"),
            label: "Profil LinkedIn",
            textColor: UIColor.textColor,
            backgroundColor: UIColor.black,
            url: nil,
            shouldCreateContactOnSelect: false,
            shouldSendMailOnSelect: false
        ).map()

        let newContactCell = ContactCellViewModelMapper(
            image: #imageLiteral(resourceName: "contactIcon"),
            label: "Ajouter le contact",
            textColor: UIColor.textColor,
            backgroundColor: UIColor.black,
            url: nil,
            shouldCreateContactOnSelect: true,
            shouldSendMailOnSelect: false
        ).map()

        return ContactTableViewModel(tableCells: [phoneCell, mailCell, linkdInCell, newContactCell])
    }
    
}
