//
//  FormationDetailViewController.swift
//  CV
//
//  Created by Mélodie Benmouffek on 19/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class FormationDetailViewController: UIViewController,
    FormationDetailViewContract {

    var presenter: FormationDetailPresenter?
    let titleLabel = UILabel()
    let schoolImageView = UIImageView()
    let informationLabel = UILabel()
    let historyLabel = UILabel()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "formation_detail_navigation_title_text".localized
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
        schoolImageView.rounded()
    }

    // MARK: - FormationDetailViewContract

    func configure(with viewModel: FormationDetailControllerViewModel) {
        titleLabel.text = viewModel.titleString
        schoolImageView.image = viewModel.image
        informationLabel.text = viewModel.informationString
        historyLabel.text = viewModel.historyString
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
        titleLabel.textColor = UIColor.mainColor
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
    }

    private func setupSchoolImageView() {
        schoolImageView.contentMode = .scaleAspectFill
    }

    private func setupInformationLabel() {
        informationLabel.numberOfLines = 0
        informationLabel.textAlignment = .center
        informationLabel.textColor = UIColor.textColor
        informationLabel.font = UIFont.italicSystemFont(ofSize: 15.0)
    }

    private func setupHistoryLabel() {
        historyLabel.numberOfLines = 0
        historyLabel.textAlignment = .center
        historyLabel.textColor = UIColor.textColor
    }

    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(schoolImageView)
        view.addSubview(informationLabel)
        view.addSubview(historyLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0).isActive = true

        schoolImageView.translatesAutoresizingMaskIntoConstraints = false
        schoolImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30.0).isActive = true
        schoolImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30.0).isActive = true
        schoolImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        schoolImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true

        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        informationLabel.topAnchor.constraint(equalTo: schoolImageView.topAnchor).isActive = true
        informationLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -30.0).isActive = true
        informationLabel.leftAnchor.constraint(equalTo: schoolImageView.rightAnchor, constant: 30.0).isActive = true
        informationLabel.bottomAnchor.constraint(equalTo: schoolImageView.bottomAnchor).isActive = true

        historyLabel.translatesAutoresizingMaskIntoConstraints = false
        historyLabel.topAnchor.constraint(equalTo: informationLabel.bottomAnchor).isActive = true
        historyLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        historyLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        historyLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupLayout()
        setupTitleLabel()
        setupSchoolImageView()
        setupInformationLabel()
        setupHistoryLabel()
    }
}
