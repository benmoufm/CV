//
//  LocalMailRepository.swift
//  CV
//
//  Created by Mélodie Benmouffek on 04/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import Contacts
import MessageUI

class LocalMailRepository: MailRepository {

    // MARK: LifeCycle

    init() {
        // TODO: (Mélodie Benmouffek) Initialize with repository dependencies
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - MailRepository

    func sendMail(_ contact: CNContact, _ completion: ((String) -> Void)?) {
        let mailSubject = "mail_subject_text".localized
        let mailBody = "mail_body_text".localized
        guard let mailTo = contact.emailAddresses.first?.value else {
            completion?("mail_error_address".localized)
            return
        }
        guard let encodedParameters = "mailto:\(mailTo)?subject=\(mailSubject)&body=\(mailBody)"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
                completion?("mail_error_encoding".localized)
                return
        }
        guard let url = URL(string: encodedParameters) else {
            completion?("mail_error_url".localized)
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            completion?("mail_error_cannot_open_url".localized)
        }
    }

}
