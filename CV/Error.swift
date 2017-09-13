//
//  Error.swift
//  CV
//
//  Created by Mélodie Benmouffek on 13/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

enum CustomError: Error {
    case contactAccessDenied
    case contactCreationError
    case mailAddressError
    case mailEncodingError
    case mailUrlError
    case mailOpenUrlError
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .contactAccessDenied:
            return "contact_access_denied".localized
        case .contactCreationError:
            return "contact_creation_error_message_popup".localized
        case .mailAddressError:
            return "mail_error_address".localized
        case .mailEncodingError:
            return "mail_error_encoding".localized
        case .mailUrlError:
            return "mail_error_url".localized
        case .mailOpenUrlError:
            return "mail_error_cannot_open_url".localized
        }
    }
}
