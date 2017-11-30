//
//  CompetenceTableViewCell.swift
//  CV
//
//  Created by Mélodie Benmouffek on 16/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class CompetenceTableViewCell: UITableViewCell {

    var evaluation: Int = 0
    var usageDescription: String = ""

    // MARK: - Lifecycle

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - CompetenceTableViewCell

    func configure(with viewModel: Skill) {
        textLabel?.text = viewModel.name
        evaluation = viewModel.evaluation
        usageDescription = viewModel.usageDescription
        selectionStyle = .gray
        textLabel?.backgroundColor = UIColor.backgroundColor
        textLabel?.textAlignment = .natural
        textLabel?.font = UIFont.systemFont(ofSize: 13.0)
        textLabel?.textColor = UIColor.textColor
    }
}
