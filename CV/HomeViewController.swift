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
        presenter?.start()
    }

    // MARK: - HomeViewContract

    func configure(with viewModel: HomeControllerViewModel) {
        homeWelcomeLabel.text = viewModel.homeWelcomeString
    }

    func setupHomeWelcomeLabel() {
        view.backgroundColor = UIColor.backgroundColor
        homeWelcomeLabel.textColor = UIColor.textColor
    }

    func setupLayout() {
        view.addSubview(homeWelcomeLabel)
        homeWelcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        homeWelcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        homeWelcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    // MARK: - Private methods

    private func setup() {
        setupLayout()
        setupHomeWelcomeLabel()
    }
}
