//
//  Coordinator.swift
//  Gist
//
//  Created by André  Costa Dantas on 02/03/21.
//

import Foundation
protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set }
}

extension Coordinator {
    func addChild(_ coordinator: Coordinator) {
        children.append(coordinator)
    }

    func removeChild(_ coordinator: Coordinator) {
        children.removeAll(where: { $0 === coordinator })
    }
}

