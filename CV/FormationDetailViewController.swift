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
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.mainColor
        navigationController?.navigationBar.tintColor = UIColor.navigationTitleTextColor
        navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.navigationTitleTextColor]
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
    }
}
