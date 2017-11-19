//
//  HttpRequest.swift
//  CV
//
//  Created by Mélodie Benmouffek on 19/11/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import Alamofire

struct HttpRequest {
    let endPoint: String
    let method: HTTPMethod
    let headers: HTTPHeaders
    let encoding: URLEncoding
    let parameters: [String: Any]

    init(endPoint: String,
         method: HTTPMethod = HTTPMethod.get,
         headers: HTTPHeaders = HTTPHeaders(),
         encoding: URLEncoding = URLEncoding.default,
         parameters: [String: Any] = [:])
    {
        self.endPoint = endPoint
        self.method = method
        self.headers = headers
        self.encoding = encoding
        self.parameters = parameters
    }
}
