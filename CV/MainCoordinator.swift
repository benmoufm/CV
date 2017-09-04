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
        let homeViewController = ViewControllerFactory.sharedInstance.homeViewController()
        let presentationViewController = ViewControllerFactory.sharedInstance.presentationViewController()
        let contactViewController = ViewControllerFactory.sharedInstance.contactViewController()
        tabBarController.viewControllers = [homeViewController, presentationViewController, contactViewController]
        window.rootViewController = tabBarController
    }
}
