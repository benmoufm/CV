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

    let switchContainerViewController: SwitchContainerViewController
    let competenceViewController: CompetenceViewController
    let experienceViewController: ExperienceViewController

    // MARK: - LifeCycle

    init(containerViewController: SwitchContainerViewController,
         competenceViewController: CompetenceViewController,
         experienceViewController: ExperienceViewController) {
        self.switchContainerViewController = containerViewController
        self.competenceViewController = competenceViewController
        self.experienceViewController = experienceViewController
        self.switchContainerViewController.competenceViewController = competenceViewController
        self.switchContainerViewController.experienceViewController = experienceViewController
    }

    // MARK: - XP

    func start() {
        switchContainerViewController.addChildViewController(competenceViewController)
        switchContainerViewController.addChildViewController(experienceViewController)
    }
}
