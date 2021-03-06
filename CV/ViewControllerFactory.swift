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

    func formationViewController() -> FormationViewController {
        let formationViewController = FormationViewController()
        let presenter = FormationPresenterImplementation(viewContract: formationViewController)
        formationViewController.presenter = presenter
        return formationViewController
    }

    func formationDetailViewController() -> FormationDetailViewController {
        let formationDetailViewController = FormationDetailViewController()
        let presenter = FormationDetailPresenterImplementation(viewContract: formationDetailViewController)
        formationDetailViewController.presenter = presenter
        return formationDetailViewController
    }

    func contactViewController() -> ContactViewController {
        let contactViewController = ContactViewController()
        let presenter = ContactPresenterImplementation(
            viewContract: contactViewController,
            contactRepository: RepositoryFactory.sharedInstance.contactRepository,
            mailRepository: RepositoryFactory.sharedInstance.mailRepository
        )
        contactViewController.presenter = presenter
        return contactViewController
    }
}
