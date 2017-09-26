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
        let contactViewController = ViewControllerFactory.sharedInstance.contactViewController()
        tabBarController.viewControllers = [homeViewController, contactViewController]
        window.rootViewController = tabBarController
    }
}
