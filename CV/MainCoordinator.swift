//
//  MainCoordinator.swift
//  CV
//
//  Created by Mélodie Benmouffek on 20/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {

    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let tabBarController = UITabBarController()
        tabBarController.view.tintColor = UIColor.mainColor
        let homeViewController = ViewControllerFactory.sharedInstance.homeViewController()
        let presentationViewController = ViewControllerFactory.sharedInstance.presentationViewController()
        let formationCoordinator = FormationCoordinator(navigationController: UINavigationController())
        addChild(formationCoordinator)
        formationCoordinator.start()
        let formationNavigationController = formationCoordinator.navigationController
        let containerViewController = ViewControllerFactory.sharedInstance.containerViewController()
        let competenceViewController = ViewControllerFactory.sharedInstance.competenceViewController()
        let experienceViewController = ViewControllerFactory.sharedInstance.experienceViewController()
        let containerCoordinator = XPCompetenceCoordinator(containerViewController: containerViewController,
                                                           competenceViewController: competenceViewController,
                                                           experienceViewController: experienceViewController)
        addChild(containerCoordinator)
        let contactViewController = ViewControllerFactory.sharedInstance.contactViewController()
        tabBarController.viewControllers = [homeViewController, presentationViewController,
                                            formationNavigationController, containerViewController,
                                            contactViewController]
        window.rootViewController = tabBarController
    }
}
