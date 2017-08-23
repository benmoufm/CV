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
        return HomeControllerViewModel(cvPictureImage:  #imageLiteral(resourceName: "pictureCV"), welcomeString: "home_welcome_text".localized)
    }

}
