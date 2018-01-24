//
//  ExperienceTableViewDataSource.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

protocol ExperienceTableViewDataSourceDelegate: class {

}

class ExperienceTableViewDataSource: NSObject,
    UITableViewDelegate,
    UITableViewDataSource {

    weak var delegate: ExperienceTableViewDataSourceDelegate?

    var viewModel: ExperienceTableViewModel = .empty

    // MARK: - ExperienceTableViewDataSource

    func configure(_ tableView: UITableView) {
        tableView.register(class: ExperienceTableViewCell.self)
    }

    func update(with viewModel: ExperienceTableViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.tableCells[section].name
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.tableCells.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableCells[section].cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ExperienceTableViewCell = tableView.dequeueCell(at: indexPath)
        cell.configure(with: viewModel.tableCells[indexPath.section].cells[indexPath.row])
        return cell

    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.mainColor
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO : Add action when cells clicked
    }

}
