//
//  FavoriteListInteractor.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import UIKit
import CoreData

protocol FavoriteListBusinessLogic {
    func getFavoriteList(request: FavoriteList.GetGistList.Request)
    func selectFavoriteList(request: FavoriteList.SelectGist.Request)
    func unFavoviteSelectList(request: FavoriteList.SelectGist.Request)
}

protocol FavoriteListDataStore {
    var selectGist: GistsViewData? { get set }
}

class FavoriteListInteractor: FavoriteListBusinessLogic, FavoriteListDataStore {
    
    // Var's
    var presenter: FavoriteListPresentationLogic?
    var selectGist: GistsViewData?
    var gistsViewData: [GistsViewData]!
    let storage: StorageProtocol
    
    init(storage: StorageProtocol = Storage()) {
        self.storage = storage
    }
    
    func getFavoriteList(request: FavoriteList.GetGistList.Request) {
        storage.getSavedGist{ result in
            switch result {
            case .success(let data):
                self.gistsViewData = self.getFavoriteGists(data: data)
                self.presenter?.presentGistList(response: FavoriteList.GetGistList.Response.Success(gists: self.gistsViewData))
            case .failure( _):
                self.presenter?.presentSelectGist(response: FavoriteList.SelectGist.Response.Failure(error: GistsError.failedToSelect))
            }
        }
    }
    
    func selectFavoriteList(request: FavoriteList.SelectGist.Request) {
        if request.selectGist.gistsUrl != "" {
            self.presenter?.presentSelectGist(response: FavoriteList.SelectGist.Response.Success(selectGist: request.selectGist))
            
        }else{
            self.presenter?.presentSelectGist(response: FavoriteList.SelectGist.Response.Failure(error: GistsError.failedToSelect))
        }
    }
    func unFavoviteSelectList(request: FavoriteList.SelectGist.Request) {
        let isFavorited = UserDefaults.standard.bool(forKey: request.selectGist.id)
        
        if isFavorited {
            UserDefaults.standard.set(false, forKey: request.selectGist.id)
            storage.deleteGist(data: request.selectGist)
            self.presenter?.presentUnSelectGist(response: FavoriteList.SelectGist.Response.Success(selectGist: request.selectGist))
        }else{
            if request.selectGist.owner.login != "" {
                UserDefaults.standard.set(true, forKey: request.selectGist.id)
                storage.saveGists(data:  getDataToSave(data: request.selectGist))
                self.presenter?.presentSelectGist(response: FavoriteList.SelectGist.Response.Success(selectGist: request.selectGist))
            } else{
                self.presenter?.presentSelectGist(response: FavoriteList.SelectGist.Response.Failure(error: GistsError.failedToSelect))
            }
        }
    }
    func getDataToSave(data: GistsViewData) -> GistsData {
        var managedContext: NSManagedObjectContext {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.persistentContainer.viewContext
        }
        
        let gist = GistsData(context: managedContext)
        let owner = OwnerGist(context: managedContext)
        let files = FilesData(context: managedContext)
        gist.gistsUrl = data.gistsUrl
        gist.id = data.id
        gist.htmlUrl = data.htmlUrl
        gist.gistsPublic = data.gistsPublic
        gist.gistsDescription = data.gistsDescription
        gist.favorite = true
        gist.gistsUrl = data.gistsUrl
        owner.avatar = data.owner.avatar
        owner.login = data.owner.login
        owner.id = Int64(data.owner.id)
        owner.profileURL = data.owner.profileURL
        owner.gistsURL =   data.owner.gistsURL
        owner.repo =   data.owner.repo
        gist.files = files
        gist.owner = owner
        
        return gist
    }
    
    func getFavoriteGists(data: [GistsData]) -> [GistsViewData] {
        var viewDataArray: [GistsViewData] = []
        for element in data {
            let viewData = GistsViewData()
            let filesViewData = FileViewData()
            let ownerViewData = OwnerViewData()
            viewData.gistsUrl = element.gistsUrl ?? String()
            viewData.id = element.id ?? String()
            viewData.gistsPublic = element.gistsPublic
            viewData.gistsDescription = element.gistsDescription ?? String()
            viewData.comments = Int(element.comments)
            viewData.favorite = true
            viewData.htmlUrl = element.htmlUrl ?? String()
            
            
            if let files = element.files {
                filesViewData.filename = files.filename ?? String()
                filesViewData.language = files.language ?? String()
                filesViewData.size = Int(files.size)
                filesViewData.type = files.type ?? String()
            }
            
            if let owner = element.owner {
                ownerViewData.login = owner.login ?? String()
                ownerViewData.id =  Int(owner.id)
                ownerViewData.profileURL =  owner.profileURL ?? String()
                ownerViewData.gistsURL = owner.gistsURL ?? String()
                ownerViewData.repo =   owner.repo ?? String()
                ownerViewData.avatar = owner.avatar ?? String()
            }
            
            viewData.owner = ownerViewData
            viewDataArray.append(viewData)
        }
        
        return viewDataArray
    }
    
    
}

