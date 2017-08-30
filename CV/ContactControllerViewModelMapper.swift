//
//  ContactControllerViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 30/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct ContactControllerViewModelMapper {

    func map() -> ContactControllerViewModel {
        return ContactControllerViewModel(tableViewImages: [#imageLiteral(resourceName: "phoneIcon"), #imageLiteral(resourceName: "emailIcon"), #imageLiteral(resourceName: "linkdInIcon"), #imageLiteral(resourceName: "contactIcon")],
                                          tableViewLabels: ["Téléphone", "Mail", "LinkdIn", "Nouveau contact"])
    }

}
