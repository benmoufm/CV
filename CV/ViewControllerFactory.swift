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

    func presentationViewController() -> PresentationViewController {
        let presentationViewController = PresentationViewController()
        let presenter = PresentationPresenterImplementation(viewContract: presentationViewController)
        presentationViewController.presenter = presenter
        return presentationViewController
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

    func containerViewController() -> SwitchContainerViewController {
        let containerViewController = SwitchContainerViewController()
        return containerViewController
    }

    func competenceViewController(_ delegate: CompetencePresenterDelegate) -> CompetenceViewController {
        let competenceViewController = CompetenceViewController()
        let presenter = CompetencePresenterImplementation(
            viewContract: competenceViewController,
            skillsRepository: RepositoryFactory.sharedInstance.skillsRepository(),
            delegate: delegate
        )
        competenceViewController.presenter = presenter
        return competenceViewController
    }

    func competenceDetailViewController(id: Int) -> CompetenceDetailViewController {
        let competenceDetailViewController = CompetenceDetailViewController()
        let presenter = CompetenceDetailPresenterImplementation(
            viewContract: competenceDetailViewController,
            skillsRepository: RepositoryFactory.sharedInstance.skillsRepository(),
            skillId: id
        )
        competenceDetailViewController.presenter = presenter
        return competenceDetailViewController
    }

    func experienceViewController(_ delegate: ExperiencePresenterDelegate) -> ExperienceViewController {
        let experienceViewController = ExperienceViewController()
        let presenter = ExperiencePresenterImplementation(
            viewContract: experienceViewController,
            experiencesRepository: RepositoryFactory.sharedInstance.experiencesRepository(),
            delegate: delegate
        )
        experienceViewController.presenter = presenter
        return experienceViewController
    }

    func experienceDetailViewController(id: Int) -> ExperienceDetailViewController {
        let experienceDetailViewController = ExperienceDetailViewController()
        let presenter = ExperienceDetailPresenterImplementation(viewContract: experienceDetailViewController)
        experienceDetailViewController.presenter = presenter
        return experienceDetailViewController
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
