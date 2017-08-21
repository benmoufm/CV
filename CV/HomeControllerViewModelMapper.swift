//
//  HomeControllerViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 20/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct HomeControllerViewModelMapper {

    func map() -> HomeControllerViewModel {
        let descriptionText = "home_welcome_text".localized
        return HomeControllerViewModel(descriptionString: descriptionText)
    }

}
