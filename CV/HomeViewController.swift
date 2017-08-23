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
    let homeWelcomeLabel = UILabel()

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
        setup()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cvPictureImageView.rounded()
    }

    // MARK: - HomeViewContract

    func configure(with viewModel: HomeControllerViewModel) {
        cvPictureImageView.image = viewModel.CVPictureImage
        homeWelcomeLabel.text = viewModel.homeWelcomeString
    }

    func setupCVPictureImage() {
        cvPictureImageView.contentMode = .scaleAspectFill
    }

    func setupHomeWelcomeLabel() {
        view.backgroundColor = UIColor.backgroundColor
        homeWelcomeLabel.textColor = UIColor.textColor
    }

    func setupLayout() {
        view.addSubview(homeWelcomeLabel)
        view.addSubview(cvPictureImageView)

        homeWelcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        homeWelcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        homeWelcomeLabel.topAnchor.constraint(equalTo: cvPictureImageView.bottomAnchor, constant: 10.0).isActive = true

        cvPictureImageView.translatesAutoresizingMaskIntoConstraints = false
        cvPictureImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cvPictureImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cvPictureImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.0).isActive = true
        cvPictureImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3.0).isActive = true
    }

    // MARK: - Private methods

    private func setup() {
        setupCVPictureImage()
        setupHomeWelcomeLabel()
        setupLayout()
    }
}
