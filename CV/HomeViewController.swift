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
    var CVPictureImage = UIImage()
    let homeWelcomeLabel = UILabel()

    // MARK: - Private properties

    private var CVPictureImageView = UIImageView()

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

    // MARK: - HomeViewContract

    func configure(with viewModel: HomeControllerViewModel) {
        CVPictureImage = viewModel.CVPictureImage
        homeWelcomeLabel.text = viewModel.homeWelcomeString
    }

    func setupCVPictureImage() {
        let scaledImage = CVPictureImage.scaleToScreen(ratio: 3.0)
        let croppedImage = scaledImage.cropToSquare()
        CVPictureImageView = UIImageView(image: croppedImage)
        CVPictureImageView.contentMode = .scaleAspectFill
        CVPictureImageView.layer.masksToBounds = true
        CVPictureImageView.rounded()
    }

    func setupHomeWelcomeLabel() {
        view.backgroundColor = UIColor.backgroundColor
        homeWelcomeLabel.textColor = UIColor.textColor
    }

    func setupLayout() {
        view.addSubview(homeWelcomeLabel)
        view.addSubview(CVPictureImageView)

        homeWelcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        homeWelcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        homeWelcomeLabel.topAnchor.constraint(equalTo: CVPictureImageView.bottomAnchor, constant: 10.0).isActive = true

        CVPictureImageView.translatesAutoresizingMaskIntoConstraints = false
        CVPictureImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        CVPictureImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    // MARK: - Private methods

    private func setup() {
        setupCVPictureImage()
        setupHomeWelcomeLabel()
        setupLayout()
    }
}
