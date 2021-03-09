//
//  StorageProtocol.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import Foundation
import CoreData

protocol StorageProtocol {
    func saveGists(data: GistsData)
    func getSavedGist(completion: @escaping (Result<[GistsData]>) -> Void)
    func deleteGist(data: GistsViewData)
}
