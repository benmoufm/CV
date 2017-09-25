//
//  ContactViewController.swift
//  CV
//
//  Created by Mélodie Benmouffek on 30/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit
import Contacts

class ContactViewController: UIViewController,
    ContactViewContract,
    ContactTableViewDataSourceDelegate {

    var presenter: ContactPresenter?
    let navigationBar = UINavigationBar()
    var tableView = UITableView()
    let dataSource = ContactTableViewDataSource()
    let cardImageView = UIImageView()
    let loadingView = UIView()
    let activityIndicatorBackgroundView = UIView()
    let activityIndicatorView = UIActivityIndicatorView()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "contact_navigation_title_text".localized
        tabBarItem.title = "contact_navigation_title_text".localized
        tabBarItem.image = #imageLiteral(resourceName: "phoneIcon")
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

    // MARK: - ContactViewContract

    func configure(with viewModel: ContactControllerViewModel) {
        cardImageView.image = viewModel.cardImage
        loadingView.isHidden = !viewModel.isLoading
        dataSource.update(with: viewModel.tableView)
        tableView.reloadData()
    }

    func displayPopup(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ok".localized,
                                      style: UIAlertActionStyle.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func displayLoadingView() {
        loadingView.isHidden = false
    }

    // MARK: - ContactTableViewDataSourceDelegate

    func contactTableViewDataSource(_ dataSource: ContactTableViewDataSource,
                                    didSelectCellWithUrl url: URL) {
        presenter?.call(url)
    }

    func contactTableViewDataSourceRequestCreateContact(_ dataSource: ContactTableViewDataSource) {
        presenter?.createContact()
    }

    func contactTableViewDateSourceRequestSendMail(_ dataSource: ContactTableViewDataSource) {
        presenter?.sendMail()
    }

    func contactTableViewDataSourceRequestOpenLinledIn(_ dataSource: ContactTableViewDataSource, didSelectCellWithLinkedInUrl url: URL) {
        presenter?.openLinkedIn(url)
    }

    // MARK: - Private methods

    private func setupLoadingView() {
        loadingView.backgroundColor = UIColor.gray.withAlphaComponent(0.3)

        activityIndicatorBackgroundView.backgroundColor = UIColor.transparentBackgroundColor
        activityIndicatorBackgroundView.clipsToBounds = true
        activityIndicatorBackgroundView.layer.cornerRadius = 10

        activityIndicatorView.hidesWhenStopped = false
        activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicatorView.startAnimating()
    }

    private func setupCardImageView() {
        cardImageView.contentMode = .scaleAspectFill
    }

    private func setupTableView() {
        dataSource.configure(tableView)
        dataSource.delegate = self
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        let footerView = UIView()
        footerView.backgroundColor = UIColor.backgroundColor
        tableView.tableFooterView = footerView
    }

    private func setupNavigationBar() {
        navigationBar.setItems([navigationItem], animated: false)
        navigationBar.barTintColor = UIColor.mainColor
        navigationBar.alpha = 0.7
        navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.navigationTitleTextColor]
    }

    private func setupLayout() {
        view.addSubview(navigationBar)
        view.addSubview(tableView)
        view.addSubview(cardImageView)
        view.addSubview(loadingView)
        loadingView.addSubview(activityIndicatorBackgroundView)
        activityIndicatorBackgroundView.addSubview(activityIndicatorView)

        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navigationBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        navigationBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 60.0).isActive = true

        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardImageView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 100.0).isActive = true
        cardImageView.heightAnchor.constraint(equalToConstant: min(view.frame.width, view.frame.height) - 250.0).isActive = true
        cardImageView.widthAnchor.constraint(equalToConstant: min(view.frame.width, view.frame.height) - 250.0).isActive = true

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 100.0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        activityIndicatorBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicatorBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicatorBackgroundView.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        activityIndicatorBackgroundView.widthAnchor.constraint(equalToConstant: 80.0).isActive = true

        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor).isActive = true
        activityIndicatorView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        activityIndicatorView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupNavigationBar()
        setupLayout()
        setupTableView()
        setupLoadingView()
    }
}
