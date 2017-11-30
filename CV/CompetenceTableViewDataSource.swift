//
//  CompetenceTableViewDataSource.swift
//  CV
//
//  Created by Mélodie Benmouffek on 16/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

protocol CompetenceTableViewDataSourceDelegate: class {

}

class CompetenceTableViewDataSource: NSObject,
    UITableViewDelegate,
    UITableViewDataSource {

    weak var delegate: CompetenceTableViewDataSourceDelegate?

    var viewModel: CompetenceTableViewModel = .empty

    // MARK: - CompetenceTableViewDataSource

    func configure(_ tableView: UITableView) {
        tableView.register(class: CompetenceTableViewCell.self)
    }

    func update(with viewModel: CompetenceTableViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.tableCells[section].name
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableCells[section].cells.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.tableCells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CompetenceTableViewCell = tableView.dequeueCell(at: indexPath)
        cell.configure(with: viewModel.tableCells[indexPath.section].cells[indexPath.row])
        return cell

    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.mainColor
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO
    }

}
