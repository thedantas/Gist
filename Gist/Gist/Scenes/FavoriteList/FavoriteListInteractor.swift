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

