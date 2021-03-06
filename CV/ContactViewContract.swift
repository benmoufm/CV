//
//  ContactViewContract.swift
//  CV
//
//  Created by Mélodie Benmouffek on 30/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol ContactViewContract: class, Loadable {

    func configure(with viewModel: ContactControllerViewModel)
    func displayPopup(_ title: String, _ message: String)
}
