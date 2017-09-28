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

    var firstActivityDetailCollapsed = false
    var secondActivityDetailCollapsed = false
    var thirdActivityDetailCollapsed = false

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

    // MARK: - Animation on gesture recognition

    func animateImage(buttonToMove: UIButton, distance: CGFloat, reverse: Bool) {
        if reverse {
            buttonToMove.inflate()
            buttonToMove.translateBack()
        } else {
            buttonToMove.deflate()
            buttonToMove.translate(distance: distance)
        }
    }

    func moveFirstImage() {
        if !firstActivityDetailCollapsed {
            animateImage(buttonToMove: firstActivityButton, distance: 125, reverse: false)
            firstActivityDetailCollapsed = true
            if secondActivityDetailCollapsed {moveSecondImage()}
            if thirdActivityDetailCollapsed {moveThirdImage()}
        } else {
            animateImage(buttonToMove: firstActivityButton, distance: -125, reverse: true)
            firstActivityDetailCollapsed = false
        }
    }

    func moveSecondImage() {
        if !secondActivityDetailCollapsed {
            animateImage(buttonToMove: secondActivityButton, distance: -125, reverse: false)
            secondActivityDetailCollapsed = true
            if firstActivityDetailCollapsed {moveFirstImage()}
            if thirdActivityDetailCollapsed {moveThirdImage()}
        } else {
            animateImage(buttonToMove: secondActivityButton, distance: 125, reverse: true)
            secondActivityDetailCollapsed = false
        }
    }

    func moveThirdImage() {
        if !thirdActivityDetailCollapsed {
            animateImage(buttonToMove: thirdActivityButton, distance: 125, reverse: false)
            thirdActivityDetailCollapsed = true
            if secondActivityDetailCollapsed {moveSecondImage()}
            if firstActivityDetailCollapsed {moveFirstImage()}
        } else {
            animateImage(buttonToMove: thirdActivityButton, distance: -125, reverse: true)
            thirdActivityDetailCollapsed = false
        }
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        navigationBar.setItems([navigationItem], animated: false)
        navigationBar.barTintColor = UIColor.mainColor
        navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.navigationTitleTextColor]
    }

    private func setupFirstActivityButton() {
        firstActivityButton.imageView?.contentMode = .scaleAspectFill
        firstActivityButton.addTarget(self,
                                      action: #selector(moveFirstImage),
                                      for: UIControlEvents.touchUpInside)
    }

    private func setupSecondActivityButton() {
        secondActivityButton.imageView?.contentMode = .scaleAspectFill
        secondActivityButton.addTarget(self,
                                      action: #selector(moveSecondImage),
                                      for: UIControlEvents.touchUpInside)
    }

    private func setupThirdActivityButton() {
        thirdActivityButton.imageView?.contentMode = .scaleAspectFill
        thirdActivityButton.addTarget(self,
                                      action: #selector(moveThirdImage),
                                      for: UIControlEvents.touchUpInside)
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
        secondActivityButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        secondActivityButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        secondActivityButton.heightAnchor.constraint(equalToConstant: 100.0).isActive = true

        secondActivityButton.imageView?.translatesAutoresizingMaskIntoConstraints = false
        secondActivityButton.imageView?.centerXAnchor.constraint(equalTo: secondActivityButton.centerXAnchor).isActive = true
        secondActivityButton.imageView?.centerYAnchor.constraint(equalTo: secondActivityButton.centerYAnchor).isActive = true
        secondActivityButton.imageView?.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        secondActivityButton.imageView?.heightAnchor.constraint(equalToConstant: 100.0).isActive = true

        firstActivityButton.translatesAutoresizingMaskIntoConstraints = false
        firstActivityButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstActivityButton.bottomAnchor.constraint(equalTo: secondActivityButton.topAnchor, constant: -50.0).isActive = true
        firstActivityButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        firstActivityButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        firstActivityButton.heightAnchor.constraint(equalToConstant: 100.0).isActive = true

        firstActivityButton.imageView?.translatesAutoresizingMaskIntoConstraints = false
        firstActivityButton.imageView?.centerXAnchor.constraint(equalTo: firstActivityButton.centerXAnchor).isActive = true
        firstActivityButton.imageView?.centerYAnchor.constraint(equalTo: firstActivityButton.centerYAnchor).isActive = true
        firstActivityButton.imageView?.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        firstActivityButton.imageView?.heightAnchor.constraint(equalToConstant: 100.0).isActive = true

        thirdActivityButton.translatesAutoresizingMaskIntoConstraints = false
        thirdActivityButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdActivityButton.topAnchor.constraint(equalTo: secondActivityButton.bottomAnchor, constant: 50.0).isActive = true
        thirdActivityButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        thirdActivityButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        thirdActivityButton.heightAnchor.constraint(equalToConstant: 100.0).isActive = true

        thirdActivityButton.imageView?.translatesAutoresizingMaskIntoConstraints = false
        thirdActivityButton.imageView?.centerXAnchor.constraint(equalTo: thirdActivityButton.centerXAnchor).isActive = true
        thirdActivityButton.imageView?.centerYAnchor.constraint(equalTo: thirdActivityButton.centerYAnchor).isActive = true
        thirdActivityButton.imageView?.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        thirdActivityButton.imageView?.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
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
