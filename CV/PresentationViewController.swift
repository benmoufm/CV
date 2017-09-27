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

    // MARK: - PresentationViewContract

    func configure(with viewModel: PresentationControllerViewModel) {
        // TODO: (Mélodie Benmouffek) 27/09/2017 Configure view
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        navigationBar.setItems([navigationItem],
                               animated: false)
        navigationBar.barTintColor = UIColor.mainColor
        navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.navigationTitleTextColor]
    }

    private func setupLayout() {
        view.addSubview(navigationBar)

        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupNavigationBar()
        setupLayout()
    }
}
