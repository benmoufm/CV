//
//  PresentationViewController.swift
//  CV
//
//  Created by Mélodie Benmouffek on 04/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class PresentationViewController: UIViewController,
    PresentationViewContract {

    var presenter: PresentationPresenter?

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

    // MARK: - PresentationViewContract

    func configure(with viewModel: PresentationControllerViewModel) {
        // TODO: (Mélodie Benmouffek) 04/09/2017 Configure view
    }

    // MARK: - Private methods

    private func setup() {
        // TODO: (Mélodie Benmouffek) 04/09/2017 Setup subviews
    }
}
