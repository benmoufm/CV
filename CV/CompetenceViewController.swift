//
//  CompetenceViewController.swift
//  CV
//
//  Created by Mélodie Benmouffek on 03/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class CompetenceViewController: UIViewController,
    CompetenceViewContract {

    var presenter: CompetencePresenter?

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

    // MARK: - CompetenceViewContract

    func configure(with viewModel: CompetenceControllerViewModel) {
        // TODO: (Mélodie Benmouffek) 03/10/2017 Configure view
    }

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
    }
}
