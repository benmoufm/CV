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

    func getJSONResults(httpRequest: HttpRequest, _ completion: ((Result<JSON>) -> Void)?) {
        var result = Result<JSON>(JSON.null)
        defer { completion?(result) }
        sessionManager.request(httpRequest.url, method: httpRequest.method,
                               parameters: httpRequest.parameters, encoding: httpRequest.encoding,
                               headers: httpRequest.headers)
            .responseJSON { (responseData) -> Void in
                if((responseData.result.value) != nil) {
                    result = Result<JSON>(JSON(responseData.result.value!))
                } else {
                    result = .error(CVError.competenceSkillAccessDenied as NSError)
                }
        }
    }

}
