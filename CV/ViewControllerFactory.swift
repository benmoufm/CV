//
//  ViewControllerFactory.swift
//  CV
//
//  Created by Mélodie Benmouffek on 20/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

final class ViewControllerFactory {

    static let sharedInstance = ViewControllerFactory()

    private init() {}

    func homeViewController() -> HomeViewController {
        let homeViewController = HomeViewController()
        let presenter = HomePresenterImplementation(viewContract: homeViewController)
        homeViewController.presenter = presenter
        return homeViewController
    }

    func contactViewController() -> ContactViewController {
        let contactViewController = ContactViewController()
        let presenter = ContactPresenterImplementation(viewContract: contactViewController)
        contactViewController.presenter = presenter
        return contactViewController
    }
}
