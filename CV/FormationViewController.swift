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

    // MARK: - FormationViewContract

    func configure(with viewModel: FormationControllerViewModel) {
        // TODO: (Mélodie Benmouffek) 14/09/2017 Configure view
    }

    // MARK: - Private methods

    private func setup() {
        // TODO: (Mélodie Benmouffek) 14/09/2017 Setup subviews
    }
}
