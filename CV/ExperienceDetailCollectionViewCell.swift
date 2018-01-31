//
//  ExperienceDetailCollectionViewCell.swift
//  CV
//
//  Created by Mélodie Benmouffek on 31/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import UIKit

class ExperienceDetailCollectionViewCell: UICollectionViewCell {
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - ExperienceDetailViewContract

    func configure(with viewModel: ExperienceDetailCellViewModel) {
        label.text = viewModel.skillName
    }

    // MARK: - Private methods

    private func setupLabel() {
        label.textColor = UIColor.backgroundColor
        label.textAlignment = .center
        label.font = UIFont.highlightFont
        label.adjustsFontSizeToFitWidth = true
    }

    private func setupLayout() {
        contentView.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor, constant: -5.0).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 5.0).isActive = true
    }

    private func setup() {
        setupLabel()
        setupLayout()
    }
}
