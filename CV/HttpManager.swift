//
//  HttpManager.swift
//  CV
//
//  Created by Mélodie Benmouffek on 19/11/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HttpManager {

    let sessionManager: SessionManager

    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }

    func getJSON(at url: URL, _ completion: ((Result<Void>) -> Void)?) {
        var result = Result<Void>()
        defer {
            completion?(result)
        }
        Alamofire.request("").validate().responseJSON { response in
                switch response.result {
                case .success:
                    return
                case .failure:
                    result = .error(CVError.competenceSkillAccessDenied as NSError)
                }
        }
    }

}
