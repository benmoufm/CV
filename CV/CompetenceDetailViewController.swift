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
    private let evaluationFrame = UIView()
    private let evaluationValueFrame = UIView()
    private let usageDescriptionLabel = UILabel()
    private var evaluationValueFrameWidthConstraint: NSLayoutConstraint

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        evaluationValueFrameWidthConstraint = evaluationValueFrame.widthAnchor.constraint(equalToConstant: 0)
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
        animateEvaluation(toValue: viewModel.evaluation)
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

    private func animateEvaluation(toValue value: Int) {
        let multiplier = CGFloat(value) / 5
        evaluationValueFrameWidthConstraint.isActive = false
        evaluationValueFrame.widthAnchor.constraint(
            equalTo: self.evaluationFrame.widthAnchor,
            multiplier: multiplier
            ).isActive = true
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

    private func setupEvaluationFrame() {
        evaluationFrame.backgroundColor = UIColor.transparentBackgroundColor
        evaluationFrame.layer.cornerRadius = 10.0
    }

    private func setupEvaluationValueFrame() {
        evaluationValueFrame.backgroundColor = UIColor.highlightColor
        evaluationValueFrame.layer.cornerRadius = 10.0
    }

    private func setupUsageDescriptionLabel() {
        usageDescriptionLabel.numberOfLines = 0
        usageDescriptionLabel.textAlignment = .left
        usageDescriptionLabel.textColor = UIColor.textColor
    }

    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(evaluationFrame)
        view.addSubview(evaluationValueFrame)
        view.addSubview(usageDescriptionLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0).isActive = true

        evaluationFrame.translatesAutoresizingMaskIntoConstraints = false
        evaluationFrame.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50.0).isActive = true
        evaluationFrame.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50.0).isActive = true
        evaluationFrame.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20.0).isActive = true
        evaluationFrame.heightAnchor.constraint(equalToConstant: 50.0).isActive = true

        evaluationValueFrame.translatesAutoresizingMaskIntoConstraints = false
        evaluationValueFrame.leftAnchor.constraint(equalTo: evaluationFrame.leftAnchor).isActive = true
        evaluationValueFrame.bottomAnchor.constraint(equalTo: evaluationFrame.bottomAnchor).isActive = true
        evaluationValueFrame.topAnchor.constraint(equalTo: evaluationFrame.topAnchor).isActive = true
        evaluationValueFrameWidthConstraint.isActive = true

        usageDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        usageDescriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0).isActive = true
        usageDescriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0).isActive = true
        usageDescriptionLabel.topAnchor.constraint(equalTo: evaluationFrame.bottomAnchor, constant: 50.0).isActive = true
        usageDescriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupNavigationBar()
        setupTitleLabel()
        setupEvaluationFrame()
        setupEvaluationValueFrame()
        setupUsageDescriptionLabel()
        setupLayout()
    }
}