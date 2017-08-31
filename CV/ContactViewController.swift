//
//  ContactViewController.swift
//  CV
//
//  Created by Mélodie Benmouffek on 30/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class ContactViewController: UIViewController,
    ContactViewContract,
    ContactTableViewDataSourceDelegate {

    var presenter: ContactPresenter?
    let navigationBar = UINavigationBar()
    var tableView = UITableView()
    let dataSource = ContactTableViewDataSource()

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
        dataSource.update(with: viewModel.tableView)
        tableView.reloadData()
    }

    // MARK: - ContactTableViewDataSourceDelegate

    func contactTableViewDataSource(_ dataSource: ContactTableViewDataSource,
                                    didSelectCellWithUrl url: URL) {
        presenter?.call(url)
    }

    // MARK: - Private methods

    private func setupTableView() {
        dataSource.configure(tableView)
        dataSource.delegate = self
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }

    private func setupNavigationBar() {
        navigationBar.setItems([navigationItem],
                               animated: false)
        navigationBar.barTintColor = UIColor.mainColor
        navigationBar.alpha = 0.7
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }

    private func setupLayout() {
        view.addSubview(navigationBar)
        view.addSubview(tableView)

        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navigationBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        navigationBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 60.0).isActive = true

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupNavigationBar()
        setupLayout()
        setupTableView()
    }
}
