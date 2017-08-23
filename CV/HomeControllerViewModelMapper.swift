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
        return HomeControllerViewModel(CVPictureImage:  #imageLiteral(resourceName: "pictureCV"), homeWelcomeString: "home_welcome_text".localized)
    }

}
