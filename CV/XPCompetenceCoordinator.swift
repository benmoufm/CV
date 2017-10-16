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
    private lazy var competenceViewController: CompetenceViewController =
        ViewControllerFactory.sharedInstance.competenceViewController()
    private lazy var experienceViewController: ExperienceViewController =
        ViewControllerFactory.sharedInstance.experienceViewController()

    // MARK: - LifeCycle

    init(switchContainerViewController: SwitchContainerViewController) {
        self.switchContainerViewController = switchContainerViewController
    }

    // MARK: - XP

    func start() {
        competenceViewController.title = "container_competence_segment".localized
        experienceViewController.title = "container_experience_segment".localized
        switchContainerViewController.set(
            viewControllers: [
                competenceViewController,
                experienceViewController
            ]
        )
    }
}
