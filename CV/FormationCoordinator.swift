//
//  FormationCoordinator.swift
//  CV
//
//  Created by Mélodie Benmouffek on 19/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class FormationCoordinator: Coordinator {

    let navigationController: UINavigationController

    // MARK: - LifeCycle
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Formation

    func start() {
        let formationViewController = ViewControllerFactory.sharedInstance.formationViewController()
        navigationController.pushViewController(formationViewController, animated: true)
    }
}
