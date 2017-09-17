//
//  ContactControllerViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 30/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct ContactControllerViewModelMapper {
    let hasAlreadyCreatedContact: Bool
    let hasAlreadyAddedLinkedInProfile: Bool
    let isLoading: Bool

    func map() -> ContactControllerViewModel {
        return ContactControllerViewModel(
            cardImage: #imageLiteral(resourceName: "cardIcon"),
            tableView: ContactTableViewModelMapper(
                hasAlreadyCreatedContact: hasAlreadyCreatedContact,
                hasAlreadyAddedLinkedInProfile: hasAlreadyAddedLinkedInProfile
                ).map(),
            isLoading: isLoading
        )
    }

}
