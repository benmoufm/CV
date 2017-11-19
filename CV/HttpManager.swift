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

    func execute(httpRequest: HttpRequest, _ completion: ((Result<JSON>) -> Void)?) {
        sessionManager.request(httpRequest.url,
                               method: httpRequest.method,
                               parameters: httpRequest.parameters,
                               encoding: httpRequest.encoding,
                               headers: httpRequest.headers)
            .responseJSON { (responseData) -> Void in
                let result: Result<JSON>
                if let data = responseData.result.value {
                    result = Result<JSON>(JSON(data))
                } else {
                    guard let error = responseData.error else { return }
                    result = .error(error as NSError)
                }
                completion?(result)
        }
    }

}
