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
    let descriptionLabel = UILabel()

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
        descriptionLabel.text = viewModel.descriptionString
    }

    // Set up the aspects of the objects in the view
    func setupAspect(with color: Color) {
        view.backgroundColor = color.backgroundColor
        descriptionLabel.textColor = color.textColor
    }

    // Set up the positions of the objects in the view
    func setupPosition() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    // MARK: - Private methods

    private func setup() {
        let color = Color()
        let viewModel = HomeControllerViewModel()
        view.addSubview(descriptionLabel)
        setupPosition()
        setupAspect(with: color)
        configure(with: viewModel)
    }
}
