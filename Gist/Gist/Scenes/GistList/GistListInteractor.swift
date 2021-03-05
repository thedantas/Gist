//
//  GistListInteractor.swift
//  Gist
//
//  Created by André  Costa Dantas on 02/03/21.
//

import UIKit


protocol GistListBusinessLogic {
    func getGistList(request: GistList.GetGistList.Request)
    func selectGist(request: GistList.SelectGist.Request)
}

protocol GistListDataStore {
    var selectGist: GistsViewData? { get set }
}

class GistListInteractor: GistListBusinessLogic, GistListDataStore {
  
   
    var gistsViewData: [GistsViewData]!
    

    // Var's
    var presenter: GistListPresentationLogic?
    var selectGist: GistsViewData?
    let worker: GistListWorkerProtocol?
    
    init(service: GistListWorkerProtocol) {
        self.worker = service
 
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

    func getGists(model: [GistsResponse]) -> [GistsViewData] {
        var viewDataArray: [GistsViewData] = []
        for element in model {
            let viewData = GistsViewData()
            let filesViewData = FileViewData()
            let ownerViewData = OwnerViewData()
            viewData.gistsUrl = element.url ?? String()
            viewData.id = element.id ?? String()
            viewData.htmlUrl = element.htmlURL ?? String()
            viewData.gistsPublic = element.gistsPublic ?? false
            viewData.createdAt =   element.createdAt ?? String()
            viewData.lastUpdate = element.updatedAt ?? String()
            viewData.gistsDescription = element.welcomeDescription ?? String()
            viewData.comments = element.comments ?? 0
//            viewData.favorite = self.checksFavorite(id: element.id ?? String(), data: locally)
//            if let commentsURL = element.commentsURL{
//                viewData.commnentsUrl =  commentsURL
//            }
            
            let files = getFiles(data: element.files!)
            
            if !files.isEmpty {
                filesViewData.filename = files[0].files.filename
                filesViewData.language = files[0].files.language ?? String()
                filesViewData.size = files[0].files.size
                filesViewData.type = files[0].files.type
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
            viewData.files = filesViewData
            viewData.owner = ownerViewData
            viewDataArray.append(viewData)
        }
        
        return viewDataArray
    }
    func getFiles(data: [String: File]) -> [FileExtract] {
        return data.compactMap { element in
            let format = FileExtract(key: element.key, file: element.value)
            return format
        }
    }
}

