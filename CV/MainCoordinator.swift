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
        let competenceCoordinator = CompetenceCoordinator(UINavigationController())
        addChild(competenceCoordinator)
        competenceCoordinator.start()
        let containerNavigationController = competenceCoordinator.navigationController
        let contactViewController = ViewControllerFactory.sharedInstance.contactViewController()
        tabBarController.viewControllers = [homeViewController,
                                            presentationViewController,
                                            formationNavigationController,
                                            containerNavigationController,
                                            contactViewController]
        window.rootViewController = tabBarController
    }
}
