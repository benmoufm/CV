//
//  SwitchContainerViewController.swift
//  CV
//
//  Created by Mélodie Benmouffek on 03/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class SwitchContainerViewController: UIViewController {

    let navigationBar = UINavigationBar()
    var tableView = UITableView()
    let segmentedControl = UISegmentedControl()
    let competenceViewController = UIViewController()
    let experienceViewController = UIViewController()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "container_navigation_title_text".localized
        tabBarItem.title = "container_navigation_title_text".localized
        tabBarItem.image = #imageLiteral(resourceName: "competenceIcon")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController(competenceViewController)
        addChildViewController(experienceViewController)
        setup()
    }

    func changeSegment(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            competenceViewController.view.isHidden = true
            experienceViewController.view.isHidden = false
        default:
            competenceViewController.view.isHidden = false
            experienceViewController.view.isHidden = true
        }
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        navigationBar.setItems([navigationItem], animated: false)
        navigationBar.barTintColor = UIColor.mainColor
        navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.navigationTitleTextColor]
    }

    private func setupSegmentedControl() {
        segmentedControl.insertSegment(withTitle: "container_competence_segment".localized, at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "container_experience_segment".localized, at: 1, animated: false)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(changeSegment), for: .valueChanged)
    }

    private func setupChildViewControllers() {
        experienceViewController.view.isHidden = true
    }

    private func setupLayout() {
        view.addSubview(navigationBar)
        view.addSubview(competenceViewController.view)
        view.addSubview(experienceViewController.view)
        view.addSubview(segmentedControl)

        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navigationBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        navigationBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 60.0).isActive = true

        competenceViewController.view.translatesAutoresizingMaskIntoConstraints = false
        competenceViewController.view.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 75.0).isActive = true
        competenceViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        competenceViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        competenceViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true

        experienceViewController.view.translatesAutoresizingMaskIntoConstraints = false
        experienceViewController.view.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 75.0).isActive = true
        experienceViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        experienceViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        experienceViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 20.0).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        segmentedControl.widthAnchor.constraint(equalToConstant: 200.0).isActive = true

    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupLayout()
        setupNavigationBar()
        setupSegmentedControl()
        setupChildViewControllers()
    }
}
