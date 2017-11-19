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
    let BASE_URL = "https://demo6086858.mockable.io/"

    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }

    func execute(httpRequest: HttpRequest, _ completion: ((Result<JSON>) -> Void)?) {
        sessionManager.request(BASE_URL + httpRequest.endPoint,
                               method: httpRequest.method,
                               parameters: httpRequest.parameters,
                               encoding: httpRequest.encoding,
                               headers: httpRequest.headers)
            .responseJSON { (responseData) -> Void in
                let result: Result<JSON>
                switch responseData.result {
                case .success(let data):
                    result = .value(JSON(data))
                case .failure(let error):
                    result = .error(error as NSError)
                }
                completion?(result)
        }
    }

}
