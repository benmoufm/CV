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
    UITableViewDelegate,
    UITableViewDataSource {

    var presenter: ContactPresenter?
    let navigationBar = UINavigationBar()
    let tableView = UITableView()
    var tableViewImage: [UIImage] = [UIImage]()
    var tableViewLabels: [String] = [String]()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "contact_navigation_title_text".localized
        tabBarItem.title = "contact_navigation_title_text".localized
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
        tableViewImage = viewModel.tableViewImages
        tableViewLabels = viewModel.tableViewLabels
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewLabels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
        cell.textLabel?.text = tableViewLabels[indexPath.row]
        cell.textLabel?.textColor = UIColor.textColor
        cell.imageView?.image = tableViewImage[indexPath.row]
        cell.backgroundColor = UIColor.black
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }

    // MARK: - Private methods

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
