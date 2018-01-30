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

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
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

    private func setup() {
        // TODO: (Mélodie Benmouffek) 30/01/2018 Setup subviews
    }
}
