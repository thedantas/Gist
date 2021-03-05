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
}

protocol GistDetailDataStore {
    var selectGist: GistsListViewData? { get set }
}

class GistDetailInteractor: GistDetailBusinessLogic, GistDetailDataStore {
   
    var gistsViewData: [GistsListViewData]!
    

    // Var's
    var presenter: GistDetailPresentationLogic?
    var selectGist: GistsListViewData?
    let worker: GistDetailWorkerProtocol? = nil 
    
    
    func getGistDetail(request: GistDetail.GetGistDetail.Request) {
        print(selectGist)
    }

    
}

