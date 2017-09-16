//
//  FormationCollectionViewDataSource.swift
//  CV
//
//  Created by Mélodie Benmouffek on 15/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class FormationCollectionViewDataSource: NSObject,
    UICollectionViewDelegate,
    UICollectionViewDataSource {

    var viewModel: FormationCollectionViewModel = .empty

    // MARK: - FormationCollectionViewDataSource

    func configure(_ collectionView: UICollectionView) {
        collectionView.register(class: FormationCollectionViewCell.self)
    }

    func update(with viewModel: FormationCollectionViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - UITableViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cells.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FormationCollectionViewCell = collectionView.dequeueCell(at: indexPath)
        cell.configure(with: viewModel.cells[indexPath.row])
        return cell
    }

    // MARK: - UITableViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO : Add actions
    }
}
