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
    ExperienceViewContract,
    ExperienceTableViewDataSourceDelegate {

    var presenter: ExperiencePresenter?
    private lazy var tableView = UITableView()
    private let dataSource = ExperienceTableViewDataSource()

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
        dataSource.update(with: viewModel.tableView)
        tableView.reloadData()
    }

    func displayAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ok".localized,
                                      style: UIAlertActionStyle.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    // MARK: - CompetenceTableViewDataSourceDelegate

    func experienceTableViewDataSource(_ dataSource: ExperienceTableViewDataSource, requestXP: Int) {
        presenter?.delegate.presentForId(presenter!, id: requestXP)
    }

    // MARK: - Private methods

    private func setupTableView() {
        dataSource.configure(tableView)
        dataSource.delegate = self
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }

    private func setupLayout() {
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupTableView()
        setupLayout()
    }
}
