//
//  FormationCollectionViewDataSource.swift
//  CV
//
//  Created by Mélodie Benmouffek on 15/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

protocol FormationCollectionViewDataSourceDelegate: class {
    func formationCollectionViewDataSource(_ dataSource: FormationCollectionViewDataSource)
    func reloadFormationCollectionViewDataSource(_ dataSource: FormationCollectionViewDataSource)
}

class FormationCollectionViewDataSource: NSObject,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UIScrollViewDelegate {

    weak var delegate: FormationCollectionViewDataSourceDelegate?

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
        delegate?.formationCollectionViewDataSource(self)
    }

    // MARK: - UIScrollViewDelegate

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.showsHorizontalScrollIndicator = false
        print(scrollView.contentOffset)
        if floor(scrollView.contentOffset.x) > 100.0 {
            let updatedViewModel: FormationCollectionViewModel
            if scrollView.contentOffset.x < 0 {
                // Scroll vers la droite => ajout d'un item sur la gauche
                updatedViewModel = FormationCollectionViewModel(cells: addCellOnTheLeft(cells: viewModel.cells))
            } else {
                // Scroll vers la gauche => ajout d'un item sur la droite
                updatedViewModel = FormationCollectionViewModel(cells: addCellOnTheRight(cells: viewModel.cells))
            }
            self.update(with: updatedViewModel)
            delegate?.reloadFormationCollectionViewDataSource(self)
            scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: false)
        }
    }

    // MARK: - Private methods

    private func addCellOnTheRight(cells: [FormationCellViewModel]) -> [FormationCellViewModel] {
        var backupCells = cells
        for i in 0..<backupCells.count-1 {
            backupCells[i] = backupCells[i+1]
        }
        backupCells[backupCells.count - 1] = cells[0]
        return backupCells
    }

    private func addCellOnTheLeft(cells: [FormationCellViewModel]) -> [FormationCellViewModel] {
        var backupCells = cells
        for i in 1..<backupCells.count {
            backupCells[i] = backupCells[i-1]
        }
        backupCells[0] = cells[cells.count-1]
        return backupCells
    }
}
