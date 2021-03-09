//
//  WebFileInteractor.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import Foundation
import UIKit


protocol WebFileBusinessLogic {
    func getWebFile(request: WebFile.GetWebFile.Request)
    
}

protocol WebFileDataStore {
    var urlFile: String? {get set}
}

class WebFileInteractor: WebFileBusinessLogic, WebFileDataStore {
 
 

    // Var's
    var presenter: WebFilePresentationLogic?
    let worker: WebFileWorkerProtocol? = nil
    var urlFile: String?
    
    func getWebFile(request: WebFile.GetWebFile.Request) {
        presenter?.presentSelectFile(response: WebFile.GetWebFile.Response.Success(gist: urlFile ?? ""))
    }
    
    

    
}

