//
//  WebFilePresenter.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import Foundation
import UIKit

protocol WebFilePresentationLogic {
    
    func presentSelectFile(response: WebFile.GetWebFile.Response.Success)
    func presentSelectFile(response: WebFile.GetWebFile.Response.Failure)

}

class WebFilePresenter: WebFilePresentationLogic {

    
    
    // Var's
    weak var viewController: WebFileDisplayLogic?

    func presentSelectFile(response: WebFile.GetWebFile.Response.Success) {
        viewController?.displayWebFile(viewModel: WebFile.GetWebFile.ViewModel.Success(gist: response.gist))
    }
    
    func presentSelectFile(response: WebFile.GetWebFile.Response.Failure) {
        viewController?.displayWebFile(viewModel: WebFile.GetWebFile.ViewModel.Failure(error: response.error))
    }

}

