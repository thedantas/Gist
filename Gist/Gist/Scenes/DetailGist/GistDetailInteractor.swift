//
//  GistDetailInteractor.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import Foundation
import UIKit


protocol GistDetailBusinessLogic {
    func getGistDetail(request: GistDetail.GetGistDetail.Request)
    func selectFile(request: GistDetail.SelectFile.Request)
}

protocol GistDetailDataStore {
    var selectGist: GistsViewData? { get set }
    var urlFile: String? {get set}
}

class GistDetailInteractor: GistDetailBusinessLogic, GistDetailDataStore {
    var urlFile: String?
    
   
    var gistsViewData: [GistsViewData]!
    

    // Var's
    var presenter: GistDetailPresentationLogic?
    var selectGist: GistsViewData?
    let worker: GistDetailWorkerProtocol? = nil 
    
    
    func getGistDetail(request: GistDetail.GetGistDetail.Request) {
        if selectGist != nil {
            presenter?.presentGistDetail(response: GistDetail.GetGistDetail.Response.Success(gist: selectGist!))
        }
       
    }
    func selectFile(request: GistDetail.SelectFile.Request) {
        if request.selectFile.rawURL != "" {
            self.urlFile = request.selectFile.rawURL
            self.presenter?.presentSelectFile(response: GistDetail.SelectFile.Response.Success(selectGist: urlFile ?? ""))
        } else{
            self.presenter?.presentSelectFile(response: GistDetail.SelectFile.Response.Failure(error: GistsError.failedToSelect))
        }
    }
    
    

    
}

