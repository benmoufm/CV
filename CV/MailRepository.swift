//
//  MailRepository.swift
//  CV
//
//  Created by Mélodie Benmouffek on 04/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import Contacts

protocol MailRepository {
    func sendMail(_ contact: CNContact, _ completion: ((Bool) -> Void)?)
}
