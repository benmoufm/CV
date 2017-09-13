//
//  ContactRepository.swift
//  CV
//
//  Created by Mélodie Benmouffek on 03/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import Contacts

protocol ContactRepository {
    var melodieContact: CNContact { get }
    func createContact(_ contact: CNContact, _ completion: ((Result<Void>) -> Void)?)
}
