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
    CompetenceViewContract,
    CompetenceTableViewDataSourceDelegate {

    var switchViewController = UIViewController()
    var presenter: CompetencePresenter?
    var tableView = UITableView()
    let dataSource = CompetenceTableViewDataSource()

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

    func competenceTableViewDataSource(_ dataSource: CompetenceTableViewDataSource, didSelectSkill id: Int) {
        presenter?.didSelect(skill: id)
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
