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

    // MARK: - Private properties

    private let cvPictureImageView = UIImageView()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
        setNavigationBar()
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

    private func setupCVPictureImage() {
        cvPictureImageView.contentMode = .scaleAspectFill
    }

    private func setupWelcomeLabel() {
        welcomeLabel.lineBreakMode = .byWordWrapping
        welcomeLabel.sizeToFit()
        welcomeLabel.numberOfLines = 0
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = UIColor.textColor
    }

    private func setupLayout() {
        view.addSubview(welcomeLabel)
        view.addSubview(cvPictureImageView)

        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.topAnchor.constraint(equalTo: cvPictureImageView.bottomAnchor, constant: 100.0).isActive = true
        welcomeLabel.widthAnchor.constraint(equalToConstant: view.bounds.width / 1.5).isActive = true

        cvPictureImageView.translatesAutoresizingMaskIntoConstraints = false
        cvPictureImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cvPictureImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100.0).isActive = true
        cvPictureImageView.widthAnchor.constraint(equalToConstant: view.bounds.width / 3.0).isActive = true
        cvPictureImageView.heightAnchor.constraint(equalToConstant: view.bounds.width / 3.0).isActive = true
    }

    private func setNavigationBar() {
        let viewSize: CGRect = view.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: viewSize.width, height: 60))
        let navItem = UINavigationItem(title: "home_navigation_title_text".localized)
        navBar.setItems([navItem], animated: false)
        navBar.barTintColor = UIColor.mainColor
        navBar.alpha = 0.7
        navBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        self.view.addSubview(navBar)
    }

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupCVPictureImage()
        setupWelcomeLabel()
        setupLayout()
    }
}
