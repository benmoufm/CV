//
//  PresentationViewContract.swift
//  CV
//
//  Created by Mélodie Benmouffek on 27/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol PresentationViewContract: class {

    func configure(with viewModel: PresentationControllerViewModel)
}
