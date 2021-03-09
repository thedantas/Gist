//
//  GistListInteractor.swift
//  Gist
//
//  Created by André  Costa Dantas on 02/03/21.
//

import UIKit
import CoreData

protocol GistListBusinessLogic {
    func getGistList(request: GistList.GetGistList.Request)
    func selectGist(request: GistList.SelectGist.Request)
    func favoriteGist(request: GistList.SelectGist.Request)
}

protocol GistListDataStore {
    var selectGist: GistsViewData? { get set }
}

class GistListInteractor: GistListBusinessLogic, GistListDataStore {
    
    // Var's
    var presenter: GistListPresentationLogic?
    var selectGist: GistsViewData?
    let worker: GistListWorkerProtocol?
    let storage: StorageProtocol?
    var gistsViewData: [GistsViewData]!
    
    init(service: GistListWorkerProtocol, storage: StorageProtocol = Storage()) {
        self.worker = service
        self.storage = storage
 
    }

    func selectGist(request: GistList.SelectGist.Request) {
        if request.selectGist.owner.login != "" {
            self.selectGist = request.selectGist
            self.presenter?.presentSelectGist(response: GistList.SelectGist.Response.Success(selectGist: request.selectGist))
        } else{
            self.presenter?.presentSelectGist(response: GistList.SelectGist.Response.Failure(error: GistsError.failedToSelect))
        }
    }
    
    func getGistList(request: GistList.GetGistList.Request) {
        self.worker?.fetchList(page: request.page) { result in
            switch result {
            case .success(let data):
                self.presenter?.presentGistList(response: GistList.GetGistList.Response.Success(gists: self.getGists(model: data)))

            case .failure(let error):
                self.presenter?.presentGistList(response: GistList.GetGistList.Response.Failure(error: error))

            }
            
        }
    }
    
    func favoriteGist(request: GistList.SelectGist.Request) {
     
        if request.selectGist.owner.login != "" {
            storage?.saveGists(data:  getDataToSave(data: request.selectGist))
            self.presenter?.presentFavoriteGist(response: GistList.FavoriteGist.Response.Success(selectGist: request.selectGist))
        } else{
            self.presenter?.presentFavoriteGist(response: GistList.FavoriteGist.Response.Failure(error: GistsError.failedToSelect))
        }
    }
    
    func getGists(model: [GistsResponse]) -> [GistsViewData] {
        var viewDataArray: [GistsViewData] = []
        for element in model {
            let viewData = GistsViewData()
            var filesViewData: [FileViewData] = [FileViewData()]
            let ownerViewData = OwnerViewData()
            viewData.gistsUrl = element.url ?? String()
            viewData.id = element.id ?? String()
            viewData.htmlUrl = element.htmlURL ?? String()
            viewData.gistsPublic = element.gistsPublic ?? false
            viewData.createdAt =   element.createdAt ?? String()
            viewData.lastUpdate = element.updatedAt ?? String()
            viewData.gistsDescription = element.welcomeDescription ?? String()
            viewData.comments = element.comments ?? 0
            viewData.favorite = false
            let files = getFiles(data: element.files!)
        
            if !files.isEmpty {
                for file in files {
                    var i = 0
               
                    filesViewData[i].filename = file.files.filename
                    filesViewData[i].language = file.files.language ?? String()
                    filesViewData[i].size = file.files.size
                    filesViewData[i].type = file.files.type
                    filesViewData[i].rawURL = file.files.rawURL
                    filesViewData.append(contentsOf: filesViewData)
                    viewData.files.append(file.files)
                    i += 1
                }

            }
     
            if let owner = element.owner {
                ownerViewData.login = owner.login ?? String()
                ownerViewData.id =  owner.id ?? 0
                if let avatarURL = owner.avatarURL {
                    ownerViewData.avatar = avatarURL
                }
                
                if let url =  element.owner?.url {
                    ownerViewData.profileURL = url
                }
                
                if let gistsURL =  element.owner?.gistsURL {
                    ownerViewData.gistsURL =   gistsURL
                }
                
                if let reposURL =  element.owner?.reposURL {
                    ownerViewData.repo =  reposURL
                }
                
            }
            viewData.owner = ownerViewData
            viewDataArray.append(viewData)
        }
        
        return viewDataArray
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
    func checksFavorite(id: String, data: [GistsViewData]) -> Bool {
        for element in data {
            if element.id == id {
                return true
            }
        }
        return false
    }
    func getFiles(data: [String: File]) -> [FileExtract] {
        return data.compactMap { element in
            let format = FileExtract(key: element.key, file: element.value)
            return format
        }
    }
}

