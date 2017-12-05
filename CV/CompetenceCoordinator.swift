//
//  CompetenceCoordinator.swift
//  CV
//
//  Created by Mélodie Benmouffek on 05/12/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class CompetenceCoordinator: Coordinator {

    let navigationController: UINavigationController

    // MARK: - LifeCycle
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - CompetenceCoordinator
    func start() {
        let containerViewController = ViewControllerFactory.sharedInstance.containerViewController()
        let containerCoordinator = XPCompetenceCoordinator(switchContainerViewController: containerViewController)
        addChild(containerCoordinator)
        containerCoordinator.start()
        navigationController.pushViewController(containerViewController, animated: false)
    }
}
