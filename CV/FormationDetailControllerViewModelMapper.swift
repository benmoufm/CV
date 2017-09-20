//
//  FormationDetailControllerViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 19/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct FormationDetailControllerViewModelMapper {

    func map() -> FormationDetailControllerViewModel {
        return FormationDetailControllerViewModel(
            titleString: "formation_detail_title".localized,
            image: #imageLiteral(resourceName: "pictureCV"),
            informationString: "formation_detail_information".localized,
            historyString: "formation_detail_history".localized)
    }

}
