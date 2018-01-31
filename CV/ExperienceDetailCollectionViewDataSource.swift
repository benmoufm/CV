//
//  ExperienceDetailCollectionViewDataSource.swift
//  CV
//
//  Created by Mélodie Benmouffek on 30/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class ExperienceDetailCollectionViewDataSource: NSObject,
    UICollectionViewDelegate,
    UICollectionViewDataSource {

    var viewModel: ExperienceDetailCollectionViewModel = .empty

    // MARK: - ExperienceDetailCollectionViewDataSource

    func configure(_ collectionView: UICollectionView) {
        collectionView.register(class: ExperienceDetailCollectionViewCell.self)
    }

    func update(with viewModel: ExperienceDetailCollectionViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - UITableViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cells.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ExperienceDetailCollectionViewCell = collectionView.dequeueCell(at: indexPath)
        cell.backgroundColor = UIColor.mainColor
        cell.layer.cornerRadius = 10.0
        cell.configure(with: viewModel.cells[indexPath.row])
        return cell
    }
}
