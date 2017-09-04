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

class LocalMailRepository: UIViewController, MFMailComposeViewControllerDelegate, MailRepository {

    // MARK: LifeCycle

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }

    // MARK: - MailRepository

    func sendMail(_ contact: CNContact, _ completion: ((Bool) -> Void)?) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["m.benmouffek@gmail.com"])
            mail.setSubject("Test")
            mail.setMessageBody("<p>Ceci est un test</p>", isHTML: true)

            self.present(mail, animated: true)
        } else {
            completion?(false)
        }
    }

}
