//
//  PresentationViewController.swift
//  CV
//
//  Created by Mélodie Benmouffek on 27/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class PresentationViewController: UIViewController,
    PresentationViewContract {

    var presenter: PresentationPresenter?
    let navigationBar = UINavigationBar()
    let firstPictureImageView = UIImageView()
    let secondPictureImageView = UIImageView()
    let thirdPictureImageView = UIImageView()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "presentation_navigation_title_text".localized
        tabBarItem.title = "presentation_navigation_title_text".localized
        tabBarItem.image = #imageLiteral(resourceName: "presentationIcon")
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.start()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        firstPictureImageView.rounded()
        secondPictureImageView.rounded()
        thirdPictureImageView.rounded()
    }

    // MARK: - PresentationViewContract

    func configure(with viewModel: PresentationControllerViewModel) {
        firstPictureImageView.image = viewModel.firstPictureImage
        secondPictureImageView.image = viewModel.secondPictureImage
        thirdPictureImageView.image = viewModel.thirdPictureImage
    }

    // MARK: - Animation on gesture recognition

    func moveImageToTheRight() {
        print("TODO : Animate to the right")
    }

    func moveImageToTheLeft() {
        print("TODO : Animate to the left")
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        navigationBar.setItems([navigationItem],
                               animated: false)
        navigationBar.barTintColor = UIColor.mainColor
        navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.navigationTitleTextColor]
    }

    private func setupFirstActivityImage() {
        firstPictureImageView.contentMode = .scaleAspectFill
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(moveImageToTheRight))
        firstPictureImageView.isUserInteractionEnabled = true
        firstPictureImageView.addGestureRecognizer(tapGestureRecognizer)
    }

    private func setupSecondActivityImage() {
        secondPictureImageView.contentMode = .scaleAspectFill
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(moveImageToTheLeft))
        secondPictureImageView.isUserInteractionEnabled = true
        secondPictureImageView.addGestureRecognizer(tapGestureRecognizer)
    }

    private func setupThirdActivityImage() {
        thirdPictureImageView.contentMode = .scaleAspectFill
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(moveImageToTheRight))
        thirdPictureImageView.isUserInteractionEnabled = true
        thirdPictureImageView.addGestureRecognizer(tapGestureRecognizer)
    }

    private func setupLayout() {
        view.addSubview(navigationBar)
        view.addSubview(firstPictureImageView)
        view.addSubview(secondPictureImageView)
        view.addSubview(thirdPictureImageView)

        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 60.0).isActive = true

        secondPictureImageView.translatesAutoresizingMaskIntoConstraints = false
        secondPictureImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondPictureImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        secondPictureImageView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        secondPictureImageView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true

        firstPictureImageView.translatesAutoresizingMaskIntoConstraints = false
        firstPictureImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstPictureImageView.bottomAnchor.constraint(equalTo: secondPictureImageView.topAnchor, constant: -50.0).isActive = true
        firstPictureImageView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        firstPictureImageView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true

        thirdPictureImageView.translatesAutoresizingMaskIntoConstraints = false
        thirdPictureImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdPictureImageView.topAnchor.constraint(equalTo: secondPictureImageView.bottomAnchor, constant: 50.0).isActive = true
        thirdPictureImageView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        thirdPictureImageView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupNavigationBar()
        setupFirstActivityImage()
        setupSecondActivityImage()
        setupThirdActivityImage()
        setupLayout()
    }
}
