//
//  JSONParsingRepository.swift
//  CV
//
//  Created by Mélodie Benmouffek on 21/11/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import Alamofire

protocol JSONParsingRepository {
    var parsedJSON: [String: Any] { get }

    func parseJson(_ httpManager: HttpManager, _ httpRequest: HttpRequest)
}
