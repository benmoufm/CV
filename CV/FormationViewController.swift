//
//  FormationViewController.swift
//  CV
//
//  Created by Mélodie Benmouffek on 14/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class FormationViewController: UIViewController,
    FormationViewContract {

    var presenter: FormationPresenter?
    let navigationBar = UINavigationBar()
    let formationIntroductionLabel = UILabel()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "formation_navigation_title_text".localized
        tabBarItem.title = "formation_navigation_title_text".localized
        tabBarItem.image = #imageLiteral(resourceName: "schoolIcon")
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

    // MARK: - FormationViewContract

    func configure(with viewModel: FormationControllerViewModel) {
        formationIntroductionLabel.text = viewModel.formationIntroductionText
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        navigationBar.setItems([navigationItem],
                               animated: false)
        navigationBar.barTintColor = UIColor.mainColor
        navigationBar.alpha = 0.7
        navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.navigationTitleTextColor]
    }

    private func setupFormationIntroductionLabel() {
        formationIntroductionLabel.lineBreakMode = .byWordWrapping
        formationIntroductionLabel.numberOfLines = 0
        formationIntroductionLabel.textAlignment = .center
        formationIntroductionLabel.textColor = UIColor.textColor
    }

    private func setupLayout() {
        view.addSubview(navigationBar)
        view.addSubview(formationIntroductionLabel)

        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 60.0).isActive = true

        formationIntroductionLabel.translatesAutoresizingMaskIntoConstraints = false
        formationIntroductionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        formationIntroductionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupNavigationBar()
        setupFormationIntroductionLabel()
        setupLayout()
    }
}
