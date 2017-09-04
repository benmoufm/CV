//
//  PopUpController.swift
//  CV
//
//  Created by Mélodie Benmouffek on 05/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class PopUpController: UIViewController {

    func showPopUp(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "contact_creation_button_text_popup".localized,
                                      style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
