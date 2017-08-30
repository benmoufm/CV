//
//  Coordinator.swift
//  CV
//
//  Created by Mélodie Benmouffek on 20/08/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class Coordinator {

    private var children: [Coordinator] = []

    func addChild(_ coordinator: Coordinator) {
        children.append(coordinator)
    }

    func removeChild(_ coordinator: Coordinator) {
        if let index = children.index(of: coordinator) {
            children.remove(at: index)
        }
    }
}

extension Coordinator: Equatable {}
func ==(lhs: Coordinator, rhs: Coordinator) -> Bool {
    return lhs === rhs
}
