//
//  ContactTableViewDataSource.swift
//  CV
//
//  Created by Mélodie Benmouffek on 01/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class ContactTableViewDataSource: NSObject,
    UITableViewDelegate,
    UITableViewDataSource{

    var viewModel: ContactTableViewModel = .empty

    // MARK: - ContactTableViewDataSource

    func configure(_ tableView: UITableView) {
        tableView.register(class: ContactTableViewCell.self)
    }

    func update(with viewModel: ContactTableViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableCells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactTableViewCell = tableView.dequeueCell(at: indexPath)
        cell.configure(with: viewModel.tableCells[indexPath.row])
        return cell

    }

}
