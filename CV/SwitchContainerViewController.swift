//
//  SwitchContainerViewController.swift
//  CV
//
//  Created by Mélodie Benmouffek on 03/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class SwitchContainerViewController: UIViewController, CompetencePresenterDelegate, ExperiencePresenterDelegate {

    private lazy var navigationBar = UINavigationBar()
    private let segmentedControl = UISegmentedControl()
    private var viewControllers: [UIViewController] = []
    private lazy var displayedViewController = UIViewController()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func changeSegment(sender: UISegmentedControl) {
        displayedViewController.willMove(toParentViewController: nil)
        displayedViewController.removeFromParentViewController()
        addChildViewController(viewControllers[sender.selectedSegmentIndex])
        displayViewController(viewControllers[sender.selectedSegmentIndex])
    }

    func set(viewControllers: [UIViewController]) {
        displayedViewController.willMove(toParentViewController: self)
        displayedViewController.view.removeFromSuperview()
        displayedViewController.removeFromParentViewController()
        self.viewControllers = viewControllers
        updateSegmentedControl()
        displayFirstChildViewController()
    }

    // MARK: - CompetencePresenterDelegate

    func presentSkill(id: Int) {
        let competenceDetailViewController =
            ViewControllerFactory.sharedInstance.competenceDetailViewController(id: id)
        navigationController?.pushViewController(competenceDetailViewController, animated: true)
    }

    // MARK: - ExperiencePresenterDelegate

    func presentExperience(id: Int) {
        let experienceDetailViewController =
            ViewControllerFactory.sharedInstance.experienceDetailViewController(id: id)
        navigationController?.pushViewController(experienceDetailViewController, animated: true)
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        navigationBar.setItems([navigationItem], animated: false)
        navigationBar.barTintColor = UIColor.mainColor
        navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.navigationTitleTextColor]
    }

    private func setupSegmentedControl() {
        segmentedControl.addTarget(self, action: #selector(changeSegment), for: .valueChanged)
        updateSegmentedControl()
    }

    private func updateSegmentedControl() {
        segmentedControl.removeAllSegments()
        viewControllers.forEach {
            segmentedControl.insertSegment(withTitle: $0.title, at: segmentedControl.numberOfSegments, animated: false)
        }
        segmentedControl.selectedSegmentIndex = 0
    }

    private func displayFirstChildViewController() {
        guard let firstViewController = viewControllers.first else { return }
        displayViewController(firstViewController)
        addChildViewController(firstViewController)
    }

    private func displayViewController(_ viewController: UIViewController) {
        displayedViewController.view.removeFromSuperview()
        view.addSubview(viewController.view)
        setupChildViewControllerViewLayout(viewController)
        displayedViewController = viewController
    }

    private func setupChildViewControllerViewLayout(_ viewController: UIViewController) {
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 75.0).isActive = true
        viewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50.0).isActive = true
        viewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        viewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }

    private func setupLayout() {
        view.addSubview(navigationBar)
        view.addSubview(segmentedControl)

        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navigationBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        navigationBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 60.0).isActive = true

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 20.0).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        segmentedControl.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupLayout()
        displayFirstChildViewController()
        setupNavigationBar()
        setupSegmentedControl()
    }
}
