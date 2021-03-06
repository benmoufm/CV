//
//  FormationControllerViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 14/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct FormationControllerViewModelMapper {

    func map() -> FormationControllerViewModel {
        return FormationControllerViewModel(
            collectionView: FormationCollectionViewModelMapper().map(),
            formationIntroductionText: "formation_introduction_text".localized)
    }

}
