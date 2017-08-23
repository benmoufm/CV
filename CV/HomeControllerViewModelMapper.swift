//
//  HomeControllerViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 20/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

struct HomeControllerViewModelMapper {

    func map() -> HomeControllerViewModel {
        let CVPictureImage = UIImage(named: "pictureCV")
        let homeWelcomeText = "home_welcome_text".localized
        return HomeControllerViewModel(CVPictureImage: CVPictureImage!, homeWelcomeString: homeWelcomeText)
    }

}
