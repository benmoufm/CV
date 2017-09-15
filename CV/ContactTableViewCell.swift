//
//  ContactTableViewCell.swift
//  CV
//
//  Created by Mélodie Benmouffek on 01/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class ContactTableViewCell: UITableViewCell {

    let checkImageView = UIImageView(image: #imageLiteral(resourceName: "checkIcon"))

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCheckImageView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCheckImageView()
    }

    func configure(with viewModel: ContactCellViewModel) {
        imageView?.image = viewModel.image
        textLabel?.text = viewModel.label
        textLabel?.textColor = viewModel.textColor
        switch viewModel.cellType {
        case .contact:
            checkImageView.isHidden = !viewModel.isSelected
        default:
            break
        }
    }

    // MARK: - Private methods

    private func setupCheckImageView() {
        checkImageView.isHidden = true
        self.addSubview(checkImageView)
        checkImageView.translatesAutoresizingMaskIntoConstraints = false
        checkImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        checkImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        checkImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20.0).isActive = true
        checkImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
