//
//  ExperienceDetailViewController.swift
//  CV
//
//  Created by Mélodie Benmouffek on 30/01/2018.
//Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class ExperienceDetailViewController: UIViewController,
    ExperienceDetailViewContract {

    var presenter: ExperienceDetailPresenter?
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let descriptionLabel = UILabel()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "container_experience_segment".localized
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

    // MARK: - ExperienceDetailViewContract

    func configure(with viewModel: ExperienceDetailControllerViewModel) {
        // TODO: (Mélodie Benmouffek) 30/01/2018 Configure view
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.mainColor
        navigationController?.navigationBar.tintColor = UIColor.navigationTitleTextColor
        navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.navigationTitleTextColor]
    }

    private func setupTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.mainColorWithAlpha
        titleLabel.font = UIFont.titleFont
    }

    private func setupDateLabel() {
        dateLabel.numberOfLines = 0
        dateLabel.textAlignment = .center
        dateLabel.textColor = UIColor.textColor
        dateLabel.font = UIFont.captionFont
    }

    private func setupDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = UIColor.textColor
    }

    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(dateLabel)
        view.addSubview(descriptionLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0).isActive = true

        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40.0).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40.0).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 50.0).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupNavigationBar()
        setupTitleLabel()
        setupDateLabel()
        setupDescriptionLabel()
        setupLayout()
    }
}
