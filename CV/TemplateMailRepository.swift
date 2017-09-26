//
//  TemplateMailRepository.swift
//  CV
//
//  Created by Mélodie Benmouffek on 04/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import Contacts
import MessageUI

class TemplateMailRepository: MailRepository {

    // MARK: LifeCycle

    // MARK: - MailRepository

    func sendMail(_ contact: CNContact, _ completion: ((Result<Void>) -> Void)?) {
        let mailSubject = "mail_subject_text".localized
        let mailBody = "mail_body_text".localized
        guard let mailTo = contact.emailAddresses.first?.value else {
            completion?(.error(CVError.mailNoAddressError as NSError))
            return
        }
        guard let encodedParameters = "mailto:\(mailTo)?subject=\(mailSubject)&body=\(mailBody)"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
                completion?(.error(CVError.mailEncodingTemplateError as NSError))
                return
        }
        guard let url = URL(string: encodedParameters) else {
            completion?(.error(CVError.mailEncodingUrlError as NSError))
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            completion?(.error(CVError.mailOpenUrlError as NSError))
        }
    }

}
