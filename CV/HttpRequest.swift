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

    init(url: URL, method: HTTPMethod, headers: HTTPHeaders) {
        self.url = url
        self.method = method
        self.headers = headers
        self.encoding = URLEncoding.default
        self.parameters = [String: Any]()
    }

    let url: URL
    let method: HTTPMethod
    let headers: HTTPHeaders
    let encoding: URLEncoding
    let parameters: [String: Any]

}
