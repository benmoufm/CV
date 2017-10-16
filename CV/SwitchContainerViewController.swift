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

    private lazy var navigationBar = UINavigationBar()
    private let segmentedControl = UISegmentedControl()
    private var viewControllers: [UIViewController] = []
    private lazy var viewControllerDisplayed = UIViewController()

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
        viewControllerDisplayed.removeFromParentViewController()
        addChildViewController(viewControllers[sender.selectedSegmentIndex])
        displayViewController(viewController: viewControllers[sender.selectedSegmentIndex])
        viewControllerDisplayed = viewControllers[sender.selectedSegmentIndex]
    }

    func set(viewControllers: [UIViewController]) {
        viewControllerDisplayed.view.removeFromSuperview()
        viewControllerDisplayed.willMove(toParentViewController: self)
        viewControllerDisplayed.removeFromParentViewController()
        self.viewControllers = viewControllers
        updateSegmentedControl()
        setupFirstChildViewController()
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

    private func setupFirstChildViewController() {
        guard let firstViewController = viewControllers.first else { return }
        viewControllerDisplayed = firstViewController
        displayViewController(viewController: firstViewController)
        addChildViewController(firstViewController)
    }

    private func displayViewController(viewController: UIViewController) {
        viewControllerDisplayed.view.removeFromSuperview()
        view.addSubview(viewController.view)
        setupChildViewControllerViewLayout(viewController)
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
        setupFirstChildViewController()
        setupNavigationBar()
        setupSegmentedControl()
    }
}
