//
//  Storage.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import Foundation
import UIKit
import CoreData

class Storage: NSObject {
    //MARK: - Local Storage Properties
    
    var gists: [NSManagedObject] = []
    
    private var managedContext: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func saveData(data: GistsData) {
        do {
            return try self.managedContext.save()
        } catch let error as NSError {
            fatalError("Erro ao salvar: \(error), \(error.userInfo)")
        }
    }

    func getAllGists(completion: @escaping (Result<[GistsData]>) -> Void) {
        let fetchRequest = NSFetchRequest<GistsData>(entityName: "GistsData")
        let sortDescriptor = NSSortDescriptor(key: "id",ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            let data = try managedContext.fetch(fetchRequest)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
    
    func deleteGistFromList(data: GistsViewData) {
        let fetchRequest = NSFetchRequest<GistsData>(entityName: "GistsData")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            for object in results {
                if object.id == data.id {
                    managedContext.delete(object)
                }
            }
        } catch let error {
            print("Detele all data in error :", error)
        }
    }
    
}

extension Storage: StorageProtocol {
    func saveGists(data: GistsData) {
        self.saveData(data: data)
    }
    
    func getSavedGist(completion: @escaping (Result<[GistsData]>) -> Void) {
        self.getAllGists { result in
            switch result {
            case .success(let data):
               completion(.success(data))
            case .failure(let error):
               completion(.failure(error))
            }
        }
    }
    
    func deleteGist(data: GistsViewData) {
        self.deleteGistFromList(data: data)
    }
    
    
}
