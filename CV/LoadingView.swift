//
//  LoadingView.swift
//  CV
//
//  Created by Mélodie Benmouffek on 25/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class LoadingView {
    let loadingView = UIView()
    let activityIndicatorBackgroundView = UIView()
    let activityIndicatorView = UIActivityIndicatorView()

    // MARK: - Life cycle

    init() {
        setupLoadingView()
        setupLayout()
    }

    func startLoading() {
        loadingView.isHidden = false
    }

    func stopLoading() {
        loadingView.isHidden = true
    }

    // MARK: - Private methods

    private func setupLoadingView() {
        loadingView.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        loadingView.isHidden = true

        activityIndicatorBackgroundView.backgroundColor = UIColor.transparentBackgroundColor
        activityIndicatorBackgroundView.clipsToBounds = true
        activityIndicatorBackgroundView.layer.cornerRadius = 10

        activityIndicatorView.hidesWhenStopped = false
        activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicatorView.startAnimating()
    }

    private func setupLayout() {
        loadingView.addSubview(activityIndicatorBackgroundView)
        activityIndicatorBackgroundView.addSubview(activityIndicatorView)

        activityIndicatorBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorBackgroundView.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
        activityIndicatorBackgroundView.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor).isActive = true
        activityIndicatorBackgroundView.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        activityIndicatorBackgroundView.widthAnchor.constraint(equalToConstant: 80.0).isActive = true

        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor).isActive = true
        activityIndicatorView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        activityIndicatorView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
}
