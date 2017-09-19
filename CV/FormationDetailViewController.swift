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
    let formationDetailLabel = UILabel()

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

    // MARK: - FormationDetailViewContract

    func configure(with viewModel: FormationDetailControllerViewModel) {
        // TODO: (Mélodie Benmouffek) 19/09/2017 Configure view
        formationDetailLabel.text = "Ceci est un test"
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.mainColor
        navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.navigationTitleTextColor]
    }

    private func setupFormationDetailLabel() {
        formationDetailLabel.numberOfLines = 0
        formationDetailLabel.textAlignment = .center
        formationDetailLabel.textColor = UIColor.textColor
    }

    private func setupLayout() {
        view.addSubview(formationDetailLabel)

        formationDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        formationDetailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        formationDetailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupLayout()
        setupFormationDetailLabel()
    }
}
