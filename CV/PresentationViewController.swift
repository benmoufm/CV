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
    let firstActivityButton = UIButton()
    let secondActivityButton = UIButton()
    let thirdActivityButton = UIButton()

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
        firstActivityButton.imageView?.rounded()
        secondActivityButton.imageView?.rounded()
        thirdActivityButton.imageView?.rounded()
    }

    // MARK: - PresentationViewContract

    func configure(with viewModel: PresentationControllerViewModel) {
        firstActivityButton.setImage(viewModel.firstPictureImage, for: .normal)
        secondActivityButton.setImage(viewModel.secondPictureImage, for: .normal)
        thirdActivityButton.setImage(viewModel.thirdPictureImage, for: .normal)
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        navigationBar.setItems([navigationItem],
                               animated: false)
        navigationBar.barTintColor = UIColor.mainColor
        navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.navigationTitleTextColor]
    }

    private func setupFirstActivityButton() {
        firstActivityButton.imageView?.contentMode = .scaleAspectFill
    }

    private func setupSecondActivityButton() {
        secondActivityButton.imageView?.contentMode = .scaleAspectFill
    }

    private func setupThirdActivityButton() {
        thirdActivityButton.imageView?.contentMode = .scaleAspectFill
    }

    private func setupLayout() {
        view.addSubview(navigationBar)
        view.addSubview(firstActivityButton)
        view.addSubview(secondActivityButton)
        view.addSubview(thirdActivityButton)

        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 60.0).isActive = true

        secondActivityButton.translatesAutoresizingMaskIntoConstraints = false
        secondActivityButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondActivityButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        secondActivityButton.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        secondActivityButton.heightAnchor.constraint(equalToConstant: 100.0).isActive = true

        firstActivityButton.translatesAutoresizingMaskIntoConstraints = false
        firstActivityButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstActivityButton.bottomAnchor.constraint(equalTo: secondActivityButton.topAnchor, constant: -50.0).isActive = true
        firstActivityButton.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        firstActivityButton.heightAnchor.constraint(equalToConstant: 100.0).isActive = true

        thirdActivityButton.translatesAutoresizingMaskIntoConstraints = false
        thirdActivityButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdActivityButton.topAnchor.constraint(equalTo: secondActivityButton.bottomAnchor, constant: 50.0).isActive = true
        thirdActivityButton.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        thirdActivityButton.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupNavigationBar()
        setupFirstActivityButton()
        setupSecondActivityButton()
        setupThirdActivityButton()
        setupLayout()
    }
}
