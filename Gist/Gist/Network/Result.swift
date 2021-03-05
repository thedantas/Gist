//
//  Result.swift
//  Gist
//
//  Created by André  Costa Dantas on 03/03/21.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
