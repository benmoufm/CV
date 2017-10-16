//
//  XPCompetenceCoordinator.swift
//  CV
//
//  Created by Mélodie Benmouffek on 16/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class XPCompetenceCoordinator: Coordinator {

    let containerViewController: SwitchContainerViewController
    let competenceViewController: CompetenceViewController
    let experienceViewController: ExperienceViewController

    // MARK: - LifeCycle

    init(containerViewController: SwitchContainerViewController,
         competenceViewController: CompetenceViewController,
         experienceViewController: ExperienceViewController) {
        self.containerViewController = containerViewController
        self.competenceViewController = competenceViewController
        self.experienceViewController = experienceViewController
        self.containerViewController.competenceViewController = competenceViewController
        self.containerViewController.experienceViewController = experienceViewController
    }

    // MARK: - XP

    func start() {
        containerViewController.addChildViewController(competenceViewController)
        containerViewController.addChildViewController(experienceViewController)
    }
}
