//
//  CompetenceDetailViewController.swift
//  CV
//
//  Created by Mélodie Benmouffek on 04/12/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class CompetenceDetailViewController: UIViewController,
    CompetenceDetailViewContract {

    var presenter: CompetenceDetailPresenter?
    private let titleLabel = UILabel()
    private let evaluationView = UIView()
    private let evaluationValueView = UIView()
    private let usageDescriptionLabel = UILabel()
    private lazy var evaluationValueViewInitialWidthConstraint = self.evaluationValueView.widthAnchor.constraint(equalToConstant: 0)
    private var evaluationValueViewWidthConstraint = NSLayoutConstraint()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "container_competence_segment".localized
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
        setup()
    }

    // MARK: - CompetenceDetailViewContract

    func configure(with viewModel: CompetenceDetailControllerViewModel) {
        titleLabel.text = viewModel.title
        usageDescriptionLabel.text = viewModel.description
        animateEvaluation(withValue: viewModel.evaluation)
    }

    func displayAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert
        )
        let alertAction = UIAlertAction(
            title: "ok".localized,
            style: UIAlertActionStyle.default, handler: nil
        )
        alert.addAction(alertAction)
        present(alert, animated: true)
    }

    // MARK: - Private methods

    private func animateEvaluation(withValue multiplier: CGFloat) {
        view.removeConstraint(evaluationValueViewInitialWidthConstraint)
        evaluationValueViewWidthConstraint = evaluationValueView.widthAnchor.constraint(
            equalTo: self.evaluationView.widthAnchor,
            multiplier: multiplier
        )
        evaluationValueViewWidthConstraint.isActive = true
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.mainColor
        navigationController?.navigationBar.tintColor = UIColor.navigationTitleTextColor
        navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.navigationTitleTextColor]
    }

    private func setupTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.mainColorWithAlpha
        titleLabel.font = UIFont.titleFont
    }

    private func setupEvaluationView() {
        evaluationView.backgroundColor = UIColor.transparentBackgroundColor
        evaluationView.layer.cornerRadius = 10.0
    }

    private func setupEvaluationValueView() {
        evaluationValueView.backgroundColor = UIColor.highlightColor
        evaluationValueView.layer.cornerRadius = 10.0
    }

    private func setupUsageDescriptionLabel() {
        usageDescriptionLabel.numberOfLines = 0
        usageDescriptionLabel.textAlignment = .left
        usageDescriptionLabel.textColor = UIColor.textColor
    }

    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(evaluationView)
        view.addSubview(evaluationValueView)
        view.addSubview(usageDescriptionLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0).isActive = true

        evaluationView.translatesAutoresizingMaskIntoConstraints = false
        evaluationView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50.0).isActive = true
        evaluationView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50.0).isActive = true
        evaluationView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20.0).isActive = true
        evaluationView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true

        evaluationValueView.translatesAutoresizingMaskIntoConstraints = false
        evaluationValueView.leftAnchor.constraint(equalTo: evaluationView.leftAnchor).isActive = true
        evaluationValueView.bottomAnchor.constraint(equalTo: evaluationView.bottomAnchor).isActive = true
        evaluationValueView.topAnchor.constraint(equalTo: evaluationView.topAnchor).isActive = true
        evaluationValueViewInitialWidthConstraint.isActive = true

        usageDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        usageDescriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0).isActive = true
        usageDescriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0).isActive = true
        usageDescriptionLabel.topAnchor.constraint(equalTo: evaluationView.bottomAnchor, constant: 50.0).isActive = true
        usageDescriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupNavigationBar()
        setupTitleLabel()
        setupEvaluationView()
        setupEvaluationValueView()
        setupUsageDescriptionLabel()
        setupLayout()
    }
}
