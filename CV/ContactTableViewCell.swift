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


    func configure(with viewModel: ContactCellViewModel) {
        imageView?.image = viewModel.image
        backgroundColor = viewModel.backgroundColor
        textLabel?.text = viewModel.label
        textLabel?.textColor = viewModel.textColor
    }
}
