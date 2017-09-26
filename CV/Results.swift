//
//  Results.swift
//  CV
//
//  Created by Mélodie Benmouffek on 13/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

enum Result<T> {
    case value(T)
    case error(NSError)

    // MARK: LifeCycle

    init(_ value: T) {
        self = .value(value)
    }

    init(_ error: NSError) {
        self = .error(error)
    }

    init(_ optional: T?, missingValueError: NSError) {
        switch optional {
        case let .some(value):
            self.init(value)
        case .none:
            self.init(missingValueError)
        }
    }

    func map<U>(_ f: (T) throws -> U) -> Result<U> {
        switch self {
        case let .value(value):
            do {
                let result = try f(value)
                return .value(result)
            } catch {
                return .error(error as NSError)
            }
        case let .error(error):
            return .error(error)
        }
    }

    func flatMap<U>(_ f: (T) throws -> Result<U>) -> Result<U> {
        switch self {
        case let .value(value):
            do {
                let result = try f(value)
                return result
            } catch {
                return .error(error as NSError)
            }
        case let .error(error):
            return .error(error)
        }
    }
}

extension Result {

    var value: T? {
        switch self {
        case let .value(value):
            return value
        case .error:
            return nil
        }
    }

    var error: NSError? {
        switch self {
        case let .error(error):
            return error
        case .value:
            return nil
        }
    }
}
