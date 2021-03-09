//
//  GistDetailPresenter.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import Foundation
import UIKit

protocol GistDetailPresentationLogic {
    func presentGistDetail(response: GistDetail.GetGistDetail.Response.Success)
    func presentGistDetail(response: GistDetail.GetGistDetail.Response.Failure)
    
    func presentSelectFile(response: GistDetail.SelectFile.Response.Success)
    func presentSelectFile(response: GistDetail.SelectFile.Response.Failure)

}

class GistDetailPresenter: GistDetailPresentationLogic {
    
    // Var's
    weak var viewController: GistDetailDisplayLogic?

    func presentGistDetail(response: GistDetail.GetGistDetail.Response.Success) {
        viewController?.displayGistDetail(viewModel: GistDetail.GetGistDetail.ViewModel.Success(gist: response.gist))
    }
    func presentGistDetail(response: GistDetail.GetGistDetail.Response.Failure) {
        viewController?.displayFailureGistDetail(viewModel: GistDetail.GetGistDetail.ViewModel.Failure(error: response.error))
    }
    func presentSelectFile(response: GistDetail.SelectFile.Response.Success) {
        viewController?.displaySelectFile(viewModel: GistDetail.SelectFile.ViewModel.Success(selectGist: response.selectGist))
    }
    
    func presentSelectFile(response: GistDetail.SelectFile.Response.Failure) {
        viewController?.displayFailureSelectFile(viewModel: GistDetail.SelectFile.ViewModel.Failure(error: response.error))
    }

}

