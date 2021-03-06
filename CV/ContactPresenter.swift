//
//  ContactPresenter.swift
//  CV
//
//  Created by Mélodie Benmouffek on 30/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol ContactPresenter: Startable {
    func call(_ url: URL)
    func openLinkedIn(_ url: URL)
    func createContact()
    func sendMail()
}
