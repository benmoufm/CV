//
//  HomeViewController.swift
//  CV
//
//  Created by Mélodie Benmouffek on 20/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, HomeViewContract {

    var presenter: HomePresenter?
    let welcomeLabel = UILabel()
    let navigationBar = UINavigationBar()

    // MARK: - Private properties

    private let cvPictureImageView = UIImageView()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "home_navigation_title_text".localized
        tabBarItem.title = "home_navigation_title_text".localized
        tabBarItem.image = #imageLiteral(resourceName: "homeIcon")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
        setup()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cvPictureImageView.rounded()
    }

    // MARK: - HomeViewContract

    func configure(with viewModel: HomeControllerViewModel) {
        cvPictureImageView.image = viewModel.cvPictureImage
        welcomeLabel.text = viewModel.welcomeString
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        navigationBar.setItems([navigationItem],
                               animated: false)
        navigationBar.barTintColor = UIColor.mainColor
        navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.navigationTitleTextColor]
    }

    private func setupCVPictureImage() {
        cvPictureImageView.contentMode = .scaleAspectFill
    }

    private func setupWelcomeLabel() {
        welcomeLabel.lineBreakMode = .byWordWrapping
        welcomeLabel.numberOfLines = 0
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = UIColor.textColor
    }

    private func setupLayout() {
        view.addSubview(welcomeLabel)
        view.addSubview(cvPictureImageView)
        view.addSubview(navigationBar)

        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.topAnchor.constraint(equalTo: cvPictureImageView.bottomAnchor, constant: 100.0).isActive = true
        welcomeLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2 / 3).isActive = true

        cvPictureImageView.translatesAutoresizingMaskIntoConstraints = false
        cvPictureImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cvPictureImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100.0).isActive = true
        cvPictureImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 3.0).isActive = true
        cvPictureImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 3.0).isActive = true

        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupNavigationBar()
        setupCVPictureImage()
        setupWelcomeLabel()
        setupLayout()
    }
}
