//
//  ExperienceViewController.swift
//  CV
//
//  Created by Mélodie Benmouffek on 16/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class ExperienceViewController: UIViewController,
    ExperienceViewContract {

    var presenter: ExperiencePresenter?

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

    // MARK: - ExperienceViewContract

    func configure(with viewModel: ExperienceControllerViewModel) {
        // TODO: (Mélodie Benmouffek) 03/10/2017 Configure view
    }

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
    }
}
