//
//  ContactTableViewDataSource.swift
//  CV
//
//  Created by Mélodie Benmouffek on 01/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

protocol ContactTableViewDataSourceDelegate: class {
    func contactTableViewDataSource(_ dataSource: ContactTableViewDataSource,
                                    didSelectCellWithUrl url: URL)
    func contactTableViewDataSourceRequestCreateContact(_ dataSource: ContactTableViewDataSource)
    func contactTableViewDateSourceRequestSendMail(_ dataSource: ContactTableViewDataSource)
    func contactTableViewDataSourceRequestOpenLinledIn(_ dataSource: ContactTableViewDataSource,
                                                       didSelectCellWithLinkedInUrl url: URL)
}

class ContactTableViewDataSource: NSObject,
    UITableViewDelegate,
    UITableViewDataSource {

    weak var delegate: ContactTableViewDataSourceDelegate?

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

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = viewModel.tableCells[indexPath.row]
        switch cellViewModel.cellType {
        case .phone(let phoneUrl):
            guard let url = phoneUrl else { break }
            delegate?.contactTableViewDataSource(self, didSelectCellWithUrl: url)
        case .mail:
            delegate?.contactTableViewDateSourceRequestSendMail(self)
        case .linkedin(let linkedinUrl):
            guard let url = linkedinUrl else { break }
            delegate?.contactTableViewDataSourceRequestOpenLinledIn(self, didSelectCellWithLinkedInUrl: url)
        case .contact:
            delegate?.contactTableViewDataSourceRequestCreateContact(self)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
