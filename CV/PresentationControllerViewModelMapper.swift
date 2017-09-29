//
//  PresentationControllerViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 27/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct PresentationControllerViewModelMapper {

    func map() -> PresentationControllerViewModel {
        return PresentationControllerViewModel(firstPictureImage: #imageLiteral(resourceName: "firstActivityIcon"),
                                               secondPictureImage: #imageLiteral(resourceName: "secondActivityIcon"),
                                               thirdPictureImage: #imageLiteral(resourceName: "thirdActivityIcon"),
                                               firstLabel: "presentation_first_activity_label".localized,
                                               secondLabel: "presentation_second_activity_label".localized,
                                               thirdLabel: "presentation_third_activity_label".localized)
    }

}
