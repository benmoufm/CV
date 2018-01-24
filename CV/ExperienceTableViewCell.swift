//
//  ExperienceTableViewCell.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class ExperienceTableViewCell: UITableViewCell {

    // MARK: - Lifecycle

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - ExperienceTableViewCell

    func configure(with viewModel: XPCellViewModel) {
        textLabel?.text = viewModel.name
        selectionStyle = .gray
        textLabel?.backgroundColor = UIColor.backgroundColor
        textLabel?.textAlignment = .natural
        textLabel?.font = UIFont.paragraphFont
        textLabel?.textColor = UIColor.textColor
    }
}
