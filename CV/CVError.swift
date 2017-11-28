//
//  CVError.swift
//  CV
//
//  Created by Mélodie Benmouffek on 13/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

enum CVError: LocalizedError {
    case contactAccessDeniedError
    case contactCreationError
    case mailNoAddressError
    case mailEncodingTemplateError
    case mailEncodingUrlError
    case mailOpenUrlError
    case unexpectedJSONFormat
    case urlFormatError

    public var errorDescription: String? {
        switch self {
        case .contactAccessDeniedError:
            return "contact_access_denied".localized
        case .contactCreationError:
            return "contact_creation_error_message_popup".localized
        case .mailNoAddressError:
            return "mail_error_address".localized
        case .mailEncodingTemplateError:
            return "mail_error_encoding".localized
        case .mailEncodingUrlError:
            return "mail_error_url".localized
        case .mailOpenUrlError:
            return "mail_error_cannot_open_url".localized
        case .unexpectedJSONFormat:
            return "competence_error_unexpected_json_format".localized
        case .urlFormatError:
            return "competence_error_cannot_open_url".localized
        }
    }
}
